package main

import (
	"flag"
	"fmt"
	"os"
	"path/filepath"
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
	if !strings.Contains(filepath.Base(path), "transformation") && !strings.Contains(filepath.Base(path), "keboola.snowflake-transformation") {
		return nil
	}

	// Check for task.jsonnet in the snowflake folder
	taskPath := filepath.Join(path, "task.jsonnet")
	if _, err := os.Stat(taskPath); err == nil {
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
	if _, err := os.Stat(kbcdirPath); os.IsNotExist(err) {
		// Create kbcdir.jsonnet if it doesn't exist
		defaultKbcdir := `
{
  isIgnored: HasProjectBackend("bigquery") == false,
}  
`
		err = os.WriteFile(kbcdirPath, []byte(defaultKbcdir), 0644)
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

func main() {
	// Define command line flags
	updateOrchestratorPtr := flag.Bool("update-orchestrator", false, "Update orchestrator task.jsonnet and kbcdir.jsonnet files")
	cleanupOrchestratorPtr := flag.Bool("cleanup-orchestrator", false, "Remove orchestrator task.jsonnet and kbcdir.jsonnet files")
	flag.Parse()

	// Get the current working directory as root
	rootDir, err := os.Getwd()
	if err != nil {
		fmt.Printf("Error getting current directory: %v\n", err)
		os.Exit(1)
	}

	// Create a new template updater
	updater := NewTemplateUpdater(rootDir)

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
