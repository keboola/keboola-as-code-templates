# Python virtual environment settings
VENV_DIR = venv
PYTHON = python3
PIP = $(VENV_DIR)/bin/pip
PYTHON_VENV = $(VENV_DIR)/bin/python
SOURCE_DIR ?= _common

.PHONY: all clean venv install-deps transpile-sql update-templates update-versions cleanup-versions

# Default target
all: transpile-sql update-templates

# Create Python virtual environment
venv:
	source $(VENV_DIR)/bin/activate

# Install Python dependencies
install-deps: venv
	$(PIP) install sqlglot

# SQL Transpiler targets
transpile-sql: install-deps
	source $(VENV_DIR)/bin/activate && $(PYTHON_VENV) sql_transpiler.py --source-dir $(SOURCE_DIR)

transpile-sql-clean: install-deps
	source $(VENV_DIR)/bin/activate && $(PYTHON_VENV) sql_transpiler.py --clean --source-dir $(SOURCE_DIR)

# Go template updater targets
update-templates:
	go run update_templates.go --update-orchestrator

update-versions:
	go run update_templates.go --update-versions

cleanup-versions:
	go run update_templates.go --cleanup-versions

# Combined targets
update-all: transpile-sql update-templates update-versions