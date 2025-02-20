package main

import (
	"bytes"
	"encoding/json"
	"flag"
	"fmt"
	"os"
	"path/filepath"
	"strconv"
	"strings"
)

// TemplateUpdater handles the template update process
type TemplateUpdater struct {
	rootDir string
}

// NewTemplateUpdater creates a new instance of TemplateUpdater
func NewTemplateUpdater(rootDir string) *TemplateUpdater {
	return &TemplateUpdater{
		rootDir: rootDir,
	}
}

// processOrchestratorFiles handles the modification of task.jsonnet and kbcdir.jsonnet files
func (tu *TemplateUpdater) processOrchestratorFiles(path string) error {
	// Check if this is a transformation orchestrator folder
	basePath := filepath.Base(path)
	if !strings.Contains(basePath, "transformation") && !strings.Contains(basePath, "keboola.snowflake-transformation") {
		return nil
	}

	// Skip if this is already a bigquery transformation folder
	if strings.Contains(basePath, "google-bigquery-transformation") {
		return nil
	}

	var err error
	// Check for task.jsonnet in the snowflake folder
	taskPath := filepath.Join(path, "task.jsonnet")
	if _, err = os.Stat(taskPath); err == nil {
		// Modify existing task.jsonnet
		content, err := os.ReadFile(taskPath)
		if err != nil {
			return fmt.Errorf("failed to read task.jsonnet: %w", err)
		}

		//		Replace snowflake transformation with bigquery transformation
		modified := strings.ReplaceAll(string(content),
			"keboola.snowflake-transformation",
			"keboola.google-bigquery-transformation")

		err = os.WriteFile(taskPath, []byte(modified), 0644)
		if err != nil {
			return fmt.Errorf("failed to write task.jsonnet: %w", err)
		}
	}

	// Check for kbcdir.jsonnet in the snowflake folder
	kbcdirPath := filepath.Join(path, "kbcdir.jsonnet")
	if _, err = os.Stat(kbcdirPath); err == nil {
		// Modify existing kbcdir.jsonnet
		content, err := os.ReadFile(kbcdirPath)
		if err != nil {
			return fmt.Errorf("failed to read kbcdir.jsonnet: %w", err)
		}

		//		Replace snowflake transformation with bigquery transformation
		modified := strings.ReplaceAll(string(content),
			"\"snowflake\"",
			"\"bigquery\"")

		err = os.WriteFile(kbcdirPath, []byte(modified), 0644)
		if err != nil {
			return fmt.Errorf("failed to create kbcdir.jsonnet: %w", err)
		}
		fmt.Printf("Created kbcdir.jsonnet in: %s\n", path)
	}

	return nil
}

// processOrchestratorCleanup removes task.jsonnet and kbcdir.jsonnet files
func (tu *TemplateUpdater) processOrchestratorCleanup(path string) error {
	// Check if this is a transformation orchestrator folder
	if !strings.Contains(filepath.Base(path), "transformation") {
		return nil
	}

	// Remove task.jsonnet if exists
	taskPath := filepath.Join(path, "task.jsonnet")
	if _, err := os.Stat(taskPath); err == nil {
		err = os.Remove(taskPath)
		fmt.Printf("Removed task.jsonnet from: %s\n", path)
	}

	// Remove kbcdir.jsonnet if exists
	kbcdirPath := filepath.Join(path, "kbcdir.jsonnet")
	if _, err := os.Stat(kbcdirPath); err == nil {
		err = os.Remove(kbcdirPath)
		fmt.Printf("Removed kbcdir.jsonnet from: %s\n", path)
	}

	return nil
}

// processFile handles the modification of a single jsonnet file
func (tu *TemplateUpdater) processFile(path string) error {
	// Read the file content
	content, err := os.ReadFile(path)
	if err != nil {
		return fmt.Errorf("failed to read file %s: %w", path, err)
	}

	contentStr := string(content)

	// Find any configuration with snowflake transformation
	if strings.Contains(contentStr, `"keboola.snowflake-transformation"`) {
		// Extract the original path and ID
		lines := strings.Split(contentStr, "\n")
		var configBlock string
		var originalPath string
		var originalID string
		var originalMetadata string
		// Find the configuration block
		for i, line := range lines {
			if strings.Contains(line, `"keboola.snowflake-transformation"`) {
				// Look for the complete block
				for j := i - 1; j < len(lines); j++ {
					if strings.Contains(lines[j], "rows: []") {
						// Found the end of block, capture it
						configBlock = strings.Join(lines[i-1:j+2], "\n")
						break
					}
				}
				// Extract path and ID from the block
				metadataSplit := false
				for _, l := range strings.Split(configBlock, "\n") {
					if strings.Contains(l, "path:") {
						originalPath = strings.TrimSpace(strings.Split(l, ":")[1])
						originalPath = strings.Trim(originalPath, `",`)
					}
					if strings.Contains(l, "id:") {
						originalID = strings.TrimSpace(strings.Split(l, ":")[1])
						originalID = strings.Trim(originalID, `",`)
					}
					if strings.Contains(l, "metadata:") {
						originalMetadata = strings.TrimSpace(strings.Split(l, "metadata:")[1])
						originalMetadata = strings.Trim(originalMetadata, `",`)
						if originalMetadata == "{" {
							originalMetadata += "\n"
							metadataSplit = true
							continue
						}
					}
					if metadataSplit {
						originalMetadata += l + "\n"
						if strings.Contains(l, "},") {
							metadataSplit = false
						}
					}
				}
				break
			}
		}

		if configBlock != "" {
			// Get the last part of the path which is the transformation name
			pathParts := strings.Split(originalPath, "/")
			transformationName := pathParts[len(pathParts)-1]

			var replacement string
			if originalMetadata != "" {
				replacement = fmt.Sprintf(`
    if HasProjectBackend("snowflake") then {
      componentId: "keboola.snowflake-transformation",
      id: %s,
      path: "transformation/keboola.snowflake-transformation/%s",
      rows: [],
      metadata: %s
    } else if HasProjectBackend("bigquery") then {
      componentId: "keboola.google-bigquery-transformation",
      id: %s,
      path: "transformation/keboola.google-bigquery-transformation/%s",
      rows: [],
      metadata: %s
    },`, originalID, transformationName, originalMetadata, originalID, transformationName, originalMetadata)
			} else {
				// Create the replacement with the same ID and transformation name
				replacement = fmt.Sprintf(`
    if HasProjectBackend("snowflake") then {
      componentId: "keboola.snowflake-transformation",
      id: %s,
      path: "transformation/keboola.snowflake-transformation/%s",
      rows: []
    } else if HasProjectBackend("bigquery") then {
      componentId: "keboola.google-bigquery-transformation",
      id: %s,
      path: "transformation/keboola.google-bigquery-transformation/%s",
      rows: []
    },`, originalID, transformationName, originalID, transformationName)
			}
			contentStr = strings.Replace(contentStr, configBlock, replacement, 1)
		}
	}

	// Write the modified content back to the file
	err = os.WriteFile(path, []byte(contentStr), 0644)
	if err != nil {
		return fmt.Errorf("failed to write file %s: %w", path, err)
	}

	return nil
}

// UpdateTemplates walks through all template directories and updates jsonnet files
func (tu *TemplateUpdater) UpdateTemplates(updateOrchestrator bool, cleanupOrchestrator bool) error {
	return filepath.Walk(tu.rootDir, func(path string, info os.FileInfo, err error) error {
		if err != nil {
			return err
		}

		// Skip directories and _common folder
		if info.IsDir() {
			if info.Name() == "_common" {
				return filepath.SkipDir
			}
			// If updating/cleaning orchestrator files and this is an orchestrator folder
			if strings.Contains(path, "keboola.orchestrator") {
				if cleanupOrchestrator {
					return tu.processOrchestratorCleanup(path)
				}
				if updateOrchestrator {
					return tu.processOrchestratorFiles(path)
				}
			}
			return nil
		}

		// Only process inputs.jsonnet and manifest.jsonnet files if not in orchestrator mode
		if !updateOrchestrator && !cleanupOrchestrator {
			filename := filepath.Base(path)
			if filename != "inputs.jsonnet" && filename != "manifest.jsonnet" {
				return nil
			}
			return tu.processFile(path)
		}

		return nil
	})
}

// RepositoryVersion represents a version entry in repository.json
type RepositoryVersion struct {
	Version     string   `json:"version"`
	Description string   `json:"description"`
	Stable      bool     `json:"stable"`
	Components  []string `json:"components"`
	Path        string   `json:"path,omitempty"`
}

// RepositoryTemplate represents a template entry in repository.json
type RepositoryTemplate struct {
	ID           string                 `json:"id"`
	Name         string                 `json:"name"`
	Description  string                 `json:"description"`
	Deprecated   bool                   `json:"deprecated,omitempty"`
	Requirements map[string]interface{} `json:"requirements,omitempty"`
	Path         string                 `json:"path,omitempty"`
	Categories   []string               `json:"categories,omitempty"`
	Versions     []RepositoryVersion    `json:"versions"`
}

// Repository represents the structure of repository.json
type Repository struct {
	Version   int                  `json:"version"`
	Author    map[string]string    `json:"author"`
	Templates []RepositoryTemplate `json:"templates"`
}

// renameSnowflakeDirectories renames all snowflake directories to bigquery in the given path
func (tu *TemplateUpdater) renameSnowflakeDirectories(path string) error {
	// Get all subdirectories
	var dirs []string
	err := filepath.Walk(path, func(p string, info os.FileInfo, err error) error {
		if err != nil {
			return err
		}
		if info.IsDir() && strings.Contains(info.Name(), "snowflake") {
			dirs = append(dirs, p)
		}
		return nil
	})
	if err != nil {
		return fmt.Errorf("failed to walk directory %s: %w", path, err)
	}

	// Process directories in reverse order (deepest first)
	for i := len(dirs) - 1; i >= 0; i-- {
		dirPath := dirs[i]
		dirName := filepath.Base(dirPath)
		if strings.Contains(dirName, "snowflake") {
			// Create the new directory name
			newDirName := strings.ReplaceAll(dirName, "snowflake", "bigquery")
			newDirPath := filepath.Join(filepath.Dir(dirPath), newDirName)

			// Rename the directory
			if err := os.Rename(dirPath, newDirPath); err != nil {
				return fmt.Errorf("failed to rename directory from %s to %s: %w", dirPath, newDirPath, err)
			}
			fmt.Printf("Renamed directory from %s to %s\n", dirPath, newDirPath)
		}
	}

	return nil
}

// UpdateRepositoryVersions updates repository.json with new major versions
func (tu *TemplateUpdater) UpdateRepositoryVersions() error {
	// Read repository.json
	repoPath := filepath.Join(tu.rootDir, ".keboola", "repository.json")
	content, err := os.ReadFile(repoPath)
	if err != nil {
		return fmt.Errorf("failed to read repository.json: %w", err)
	}

	var repo Repository
	if err := json.Unmarshal(content, &repo); err != nil {
		return fmt.Errorf("failed to parse repository.json: %w", err)
	}

	// Process each template
	for i, template := range repo.Templates {
		if len(template.Versions) == 0 {
			continue
		}

		// Get the latest version
		latestVersion := template.Versions[len(template.Versions)-1]
		currentMajor := strings.Split(latestVersion.Version, ".")[0]
		nextMajor := fmt.Sprintf("%d.0.0", atoi(currentMajor)+1)

		// Create new version entry
		newVersion := RepositoryVersion{
			Version:     nextMajor,
			Description: latestVersion.Description,
			Stable:      false,
			Components:  latestVersion.Components,
		}

		// Set path if it exists in the latest version
		if latestVersion.Path != "" {
			newVersion.Path = fmt.Sprintf("v%s", strconv.Itoa(atoi(currentMajor)+1))
		}

		// Add new version
		repo.Templates[i].Versions = append(repo.Templates[i].Versions, newVersion)

		// Copy and update template files if path exists
		if template.Path != "" && latestVersion.Path != "" {
			srcPath := filepath.Join(tu.rootDir, template.Path, latestVersion.Path)
			destPath := filepath.Join(tu.rootDir, template.Path, newVersion.Path)

			// Create destination directory
			if err := os.MkdirAll(destPath, 0755); err != nil {
				return fmt.Errorf("failed to create directory %s: %w", destPath, err)
			}

			// Copy directory contents
			err := filepath.Walk(srcPath, func(path string, info os.FileInfo, err error) error {
				if err != nil {
					return err
				}

				// Get relative path
				relPath, err := filepath.Rel(srcPath, path)
				if err != nil {
					return err
				}

				destFile := filepath.Join(destPath, relPath)

				if info.IsDir() {
					return os.MkdirAll(destFile, 0755)
				}

				// Copy file
				data, err := os.ReadFile(path)
				if err != nil {
					return err
				}
				return os.WriteFile(destFile, data, 0644)
			})
			if err != nil {
				return fmt.Errorf("failed to copy template files: %w", err)
			}
			fmt.Printf("Copied template files from %s to %s\n", srcPath, destPath)

			// Update orchestrator files in the new version
			err = filepath.Walk(destPath, func(path string, info os.FileInfo, err error) error {
				if err != nil {
					return err
				}

				if info.IsDir() {
					// Process orchestrator files in this directory
					if err := tu.processOrchestratorFiles(path); err != nil {
						return fmt.Errorf("failed to process orchestrator files in %s: %w", path, err)
					}
				}
				return nil
			})
			if err != nil {
				return fmt.Errorf("failed to update orchestrator files: %w", err)
			}
			fmt.Printf("Updated orchestrator files in: %s\n", destPath)

			// Rename snowflake directories to bigquery after all files are processed
			if err := tu.renameSnowflakeDirectories(destPath); err != nil {
				return fmt.Errorf("failed to rename snowflake directories: %w", err)
			}
		}
	}

	// Write updated repository.json
	buffer := &bytes.Buffer{}
	encoder := json.NewEncoder(buffer)
	encoder.SetEscapeHTML(false)
	encoder.SetIndent("", "  ")
	if err := encoder.Encode(repo); err != nil {
		return fmt.Errorf("failed to marshal repository.json: %w", err)
	}

	if err := os.WriteFile(repoPath, buffer.Bytes(), 0644); err != nil {
		return fmt.Errorf("failed to write repository.json: %w", err)
	}

	fmt.Println("Successfully updated repository.json with new versions")
	return nil
}

// CleanupLatestVersions removes the latest version from repository.json and its corresponding directory
func (tu *TemplateUpdater) CleanupLatestVersions() error {
	// Read repository.json
	repoPath := filepath.Join(tu.rootDir, ".keboola", "repository.json")
	content, err := os.ReadFile(repoPath)
	if err != nil {
		return fmt.Errorf("failed to read repository.json: %w", err)
	}

	var repo Repository
	if err := json.Unmarshal(content, &repo); err != nil {
		return fmt.Errorf("failed to parse repository.json: %w", err)
	}

	// Process each template
	for i, template := range repo.Templates {
		if len(template.Versions) <= 1 {
			continue // Skip if there's only one version or no versions
		}

		// Get the latest version
		latestVersion := template.Versions[len(template.Versions)-1]

		// Remove the version directory if path exists
		if template.Path != "" && latestVersion.Path != "" {
			versionPath := filepath.Join(tu.rootDir, template.Path, latestVersion.Path)
			if err := os.RemoveAll(versionPath); err != nil {
				return fmt.Errorf("failed to remove version directory %s: %w", versionPath, err)
			}
			fmt.Printf("Removed version directory: %s\n", versionPath)
		}

		// Remove the latest version from the versions array
		repo.Templates[i].Versions = repo.Templates[i].Versions[:len(repo.Templates[i].Versions)-1]
	}

	// Write updated repository.json
	buffer := &bytes.Buffer{}
	encoder := json.NewEncoder(buffer)
	encoder.SetEscapeHTML(false)
	encoder.SetIndent("", "  ")
	if err := encoder.Encode(repo); err != nil {
		return fmt.Errorf("failed to marshal repository.json: %w", err)
	}

	if err := os.WriteFile(repoPath, buffer.Bytes(), 0644); err != nil {
		return fmt.Errorf("failed to write repository.json: %w", err)
	}

	fmt.Println("Successfully removed latest versions from repository.json")
	return nil
}

// Helper function to convert string to int
func atoi(s string) int {
	i, _ := strconv.Atoi(s)
	return i
}

func main() {
	// Define command line flags
	updateOrchestratorPtr := flag.Bool("update-orchestrator", false, "Update orchestrator task.jsonnet and kbcdir.jsonnet files")
	cleanupOrchestratorPtr := flag.Bool("cleanup-orchestrator", false, "Remove orchestrator task.jsonnet and kbcdir.jsonnet files")
	updateVersionsPtr := flag.Bool("update-versions", false, "Update repository.json with new major versions and copy template files")
	cleanupVersionsPtr := flag.Bool("cleanup-versions", false, "Remove latest versions from repository.json and their directories")
	flag.Parse()

	// Get the current working directory as root
	rootDir, err := os.Getwd()
	if err != nil {
		fmt.Printf("Error getting current directory: %v\n", err)
		os.Exit(1)
	}

	// Create a new template updater
	updater := NewTemplateUpdater(rootDir)

	// Cleanup latest versions if requested
	if *cleanupVersionsPtr {
		if err := updater.CleanupLatestVersions(); err != nil {
			fmt.Printf("Error cleaning up latest versions: %v\n", err)
			os.Exit(1)
		}
		return
	}

	// Update repository versions if requested
	if *updateVersionsPtr {
		if err := updater.UpdateRepositoryVersions(); err != nil {
			fmt.Printf("Error updating repository versions: %v\n", err)
			os.Exit(1)
		}
		return
	}

	// Update all templates
	if err := updater.UpdateTemplates(*updateOrchestratorPtr, *cleanupOrchestratorPtr); err != nil {
		fmt.Printf("Error updating templates: %v\n", err)
		os.Exit(1)
	}

	if *cleanupOrchestratorPtr {
		fmt.Println("Successfully cleaned up orchestrator files")
	} else {
		fmt.Println("Successfully updated all templates")
	}
}
