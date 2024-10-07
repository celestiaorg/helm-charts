# Define default variables
DEFAULT_CELESTIA_APP_VERSION ?=
DEFAULT_CELESTIA_NODE_VERSION ?=
CONFIG_DIR ?= scripts/config
SCRIPTS_DIR ?= scripts

# Define paths to scripts
EXTRACT_CONFIGS_APP_SCRIPT := $(SCRIPTS_DIR)/extract_app_config.sh
EXTRACT_CONFIGS_NODE_SCRIPT := $(SCRIPTS_DIR)/extract_node_config.sh
CONVERT_TOML_TO_TEMPLATE_SCRIPT := $(SCRIPTS_DIR)/convert_toml_to_template.sh
CONVERT_TOML_TO_YAML_SCRIPT := $(SCRIPTS_DIR)/convert_toml_to_yaml.sh
GENERATE_DOCS_SCRIPT := $(SCRIPTS_DIR)/gen_helm_docs.sh
UPLOAD_KEYS_SCRIPT := $(SCRIPTS_DIR)/create_new_key_upload_1pass.sh

# Function to strip suffix from version
strip_suffix = $(shell echo $(1) | sed 's/-.*//')

# Prompt for celestia-app version if not set
prompt_app_version:
ifndef CELESTIA_APP_VERSION
	@read -p "Enter celestia-app version [$(DEFAULT_CELESTIA_APP_VERSION)]: " input; \
	if [ -z "$$input" ]; then \
		CELESTIA_APP_VERSION=$(DEFAULT_CELESTIA_APP_VERSION); \
	else \
		CELESTIA_APP_VERSION=$$input; \
	fi; \
	export CELESTIA_APP_VERSION; \
	$(MAKE) $(MAKECMDGOALS) CELESTIA_APP_VERSION=$$CELESTIA_APP_VERSION; \
	exit 0;
endif

# Prompt for celestia-node version if not set
prompt_node_version:
ifndef CELESTIA_NODE_VERSION
	@read -p "Enter celestia-node version [$(DEFAULT_CELESTIA_NODE_VERSION)]: " input; \
	if [ -z "$$input" ]; then \
		CELESTIA_NODE_VERSION=$(DEFAULT_CELESTIA_NODE_VERSION); \
	else \
		CELESTIA_NODE_VERSION=$$input; \
	fi; \
	export CELESTIA_NODE_VERSION; \
	$(MAKE) $(MAKECMDGOALS) CELESTIA_NODE_VERSION=$$CELESTIA_NODE_VERSION; \
	exit 0;
endif

# Extract config files for celestia-app
.PHONY: extract-app
extract-app: prompt_app_version
	@echo "Extracting config files for celestia-app version $(CELESTIA_APP_VERSION)"
	./$(EXTRACT_CONFIGS_APP_SCRIPT) $(CELESTIA_APP_VERSION)

# Extract config files for celestia-node
.PHONY: extract-node
extract-node: prompt_node_version
	@echo "Extracting config files for celestia-node version $(CELESTIA_NODE_VERSION)"
	./$(EXTRACT_CONFIGS_NODE_SCRIPT) $(CELESTIA_NODE_VERSION)

# Convert TOML to templated TOML for celestia-app
.PHONY: toml-app
toml-app: prompt_app_version
	@echo "Converting TOML to templated TOML for celestia-app version $(CELESTIA_APP_VERSION)"
	./$(CONVERT_TOML_TO_TEMPLATE_SCRIPT) $(CONFIG_DIR)/app/$(CELESTIA_APP_VERSION)/config.toml app

# Convert TOML to templated TOML for celestia-node
.PHONY: toml-node
toml-node: prompt_node_version
	@echo "Converting TOML to templated TOML for celestia-node version $(CELESTIA_NODE_VERSION)"
	./$(CONVERT_TOML_TO_TEMPLATE_SCRIPT) $(CONFIG_DIR)/node/bridge/$(CELESTIA_NODE_VERSION)/config.toml node bridge; \
	./$(CONVERT_TOML_TO_TEMPLATE_SCRIPT) $(CONFIG_DIR)/node/full/$(CELESTIA_NODE_VERSION)/config.toml node full; \
	./$(CONVERT_TOML_TO_TEMPLATE_SCRIPT) $(CONFIG_DIR)/node/light/$(CELESTIA_NODE_VERSION)/config.toml node light

# Convert TOML to YAML for celestia-app
.PHONY: yaml-app
yaml-app: prompt_app_version
	@echo "Converting TOML to YAML for celestia-app version $(CELESTIA_APP_VERSION)"
	./$(CONVERT_TOML_TO_YAML_SCRIPT) $(CONFIG_DIR)/app/$(CELESTIA_APP_VERSION)/config.toml

# Convert TOML to YAML for celestia-node
.PHONY: yaml-node
yaml-node: prompt_node_version
	@echo "Converting TOML to YAML for celestia-node version $(CELESTIA_NODE_VERSION)"
	./$(CONVERT_TOML_TO_YAML_SCRIPT) $(CONFIG_DIR)/node/bridge/$(CELESTIA_NODE_VERSION)/config.toml; \
	./$(CONVERT_TOML_TO_YAML_SCRIPT) $(CONFIG_DIR)/node/full/$(CELESTIA_NODE_VERSION)/config.toml; \
	./$(CONVERT_TOML_TO_YAML_SCRIPT) $(CONFIG_DIR)/node/light/$(CELESTIA_NODE_VERSION)/config.toml

# Generate documentation for helm charts
.PHONY: generate-docs
generate-docs:
	@echo "Generating documentation for Helm charts"
	./$(GENERATE_DOCS_SCRIPT)

# Upload keys to 1Password
.PHONY: upload-keys
upload-keys: prompt_node_version
	@echo "Uploading keys to 1Password for celestia-node version $(CELESTIA_NODE_VERSION)"
	./$(UPLOAD_KEYS_SCRIPT) $(CELESTIA_NODE_VERSION) secret-name vault-name chain

# Group targets for celestia-app
.PHONY: app
app: extract-app

# Group targets for celestia-node
.PHONY: node
node: extract-node yaml-node toml-node

# Default target
.PHONY: all
all: app node

# Help target
.PHONY: help
help:
	@echo "Usage:"
	@echo "  make extract-app           Extract config files for celestia-app"
	@echo "  make toml-app              Convert TOML to templated HC for celestia-app"
	@echo "  make yaml-app              Convert TOML to YAML for celestia-app"
	@echo "  make extract-node          Extract config files for celestia-node"
	@echo "  make toml-node             Convert TOML to templated HC for celestia-node"
	@echo "  make yaml-node             Convert TOML to YAML for celestia-node"
	@echo "  make generate-docs         Generate documentation for Helm charts"
	@echo "  make upload-keys           Upload keys to 1Password for celestia-node"
	@echo "  make app                   Run all tasks for celestia-app"
	@echo "  make node                  Run all tasks for celestia-node"
	@echo "  make all                   Run all tasks for both celestia-app and celestia-node"
	@echo "  make help                  Display this help message"
