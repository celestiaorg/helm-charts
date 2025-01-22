# Define default variables
DEFAULT_CELESTIA_APP_VERSION ?=
DEFAULT_CELESTIA_NODE_VERSION ?=
CONFIG_DIR ?= config/
SCRIPTS_DIR ?= .

# Define paths to scripts
EXTRACT_CONFIGS_APP_SCRIPT := $(SCRIPTS_DIR)/extract_app_config.sh
EXTRACT_CONFIGS_NODE_SCRIPT := $(SCRIPTS_DIR)/extract_node_config.sh
CONVERT_TOML_TO_TEMPLATE_SCRIPT := $(SCRIPTS_DIR)/convert_toml_to_template.sh
CONVERT_TOML_TO_YAML_SCRIPT := $(SCRIPTS_DIR)/convert_toml_to_yaml.sh
GENERATE_DOCS_SCRIPT := $(SCRIPTS_DIR)/gen_helm_docs.sh
UPLOAD_KEYS_SCRIPT := $(SCRIPTS_DIR)/create_new_key_upload_1pass.sh

# Function to strip suffix from version
strip_suffix = $(shell echo $(1) | sed 's/-.*//')

# Check if version is specified
check_version = $(if $(1),,$(error Version not specified. Please provide $(2) as a environment variable.))

# Extract config files for celestia-app
.PHONY: extract-app
extract-app:
	$(call check_version,$(CELESTIA_APP_VERSION),CELESTIA_APP_VERSION)
	@echo "Extracting config files for celestia-app version $(CELESTIA_APP_VERSION)"
	./$(EXTRACT_CONFIGS_APP_SCRIPT) $(CELESTIA_APP_VERSION)

# Extract config files for celestia-node
.PHONY: extract-node
extract-node:
	$(call check_version,$(CELESTIA_NODE_VERSION),CELESTIA_NODE_VERSION)
	@echo "Extracting config files for celestia-node version $(CELESTIA_NODE_VERSION)"
	./$(EXTRACT_CONFIGS_NODE_SCRIPT) $(CELESTIA_NODE_VERSION)

# Convert TOML to templated TOML for celestia-app
.PHONY: toml-app
toml-app:
	$(call check_version,$(CELESTIA_APP_VERSION),CELESTIA_APP_VERSION)
	@echo "Converting TOML to templated HELM for celestia-app version $(CELESTIA_APP_VERSION)"
	./$(CONVERT_TOML_TO_TEMPLATE_SCRIPT) $(CONFIG_DIR)/app/$(CELESTIA_APP_VERSION)/app.toml app; \
	./$(CONVERT_TOML_TO_TEMPLATE_SCRIPT) $(CONFIG_DIR)/app/$(CELESTIA_APP_VERSION)/client.toml app; \
	./$(CONVERT_TOML_TO_TEMPLATE_SCRIPT) $(CONFIG_DIR)/app/$(CELESTIA_APP_VERSION)/config.toml app

# Convert TOML to templated TOML for celestia-node
.PHONY: toml-node
toml-node:
	$(call check_version,$(CELESTIA_NODE_VERSION),CELESTIA_NODE_VERSION)
	@echo "Converting TOML to templated HELM for celestia-node version $(CELESTIA_NODE_VERSION)"
	./$(CONVERT_TOML_TO_TEMPLATE_SCRIPT) $(CONFIG_DIR)/node/bridge/$(CELESTIA_NODE_VERSION)/config.toml node bridge; \
	./$(CONVERT_TOML_TO_TEMPLATE_SCRIPT) $(CONFIG_DIR)/node/full/$(CELESTIA_NODE_VERSION)/config.toml node full; \
	./$(CONVERT_TOML_TO_TEMPLATE_SCRIPT) $(CONFIG_DIR)/node/light/$(CELESTIA_NODE_VERSION)/config.toml node light

# Convert TOML to YAML for celestia-app
.PHONY: yaml-app
yaml-app:
	$(call check_version,$(CELESTIA_APP_VERSION),CELESTIA_APP_VERSION)
	@echo "Converting TOML to YAML for celestia-app version $(CELESTIA_APP_VERSION)"
	./$(CONVERT_TOML_TO_YAML_SCRIPT) $(CONFIG_DIR)/app/$(CELESTIA_APP_VERSION)/app.toml; \
	./$(CONVERT_TOML_TO_YAML_SCRIPT) $(CONFIG_DIR)/app/$(CELESTIA_APP_VERSION)/client.toml; \
	./$(CONVERT_TOML_TO_YAML_SCRIPT) $(CONFIG_DIR)/app/$(CELESTIA_APP_VERSION)/config.toml

# Convert TOML to YAML for celestia-node
.PHONY: yaml-node
yaml-node:
	$(call check_version,$(CELESTIA_NODE_VERSION),CELESTIA_NODE_VERSION)
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
upload-keys:
	$(call check_version,$(CELESTIA_NODE_VERSION),CELESTIA_NODE_VERSION)
	@echo "Uploading keys to 1Password for celestia-node version $(CELESTIA_NODE_VERSION)"
	./$(UPLOAD_KEYS_SCRIPT) $(CELESTIA_NODE_VERSION) secret-name vault-name chain

# Group targets for celestia-app
.PHONY: app
app: extract-app yaml-app toml-app

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
	@echo "  make extract-app CELESTIA_APP_VERSION=<version>           Extract config files for celestia-app"
	@echo "  make toml-app CELESTIA_APP_VERSION=<version>              Convert TOML to templated HELM for celestia-app"
	@echo "  make yaml-app CELESTIA_APP_VERSION=<version>              Convert TOML to YAML for celestia-app"
	@echo "  make extract-node CELESTIA_NODE_VERSION=<version>         Extract config files for celestia-node"
	@echo "  make toml-node CELESTIA_NODE_VERSION=<version>            Convert TOML to templated HELM for celestia-node"
	@echo "  make yaml-node CELESTIA_NODE_VERSION=<version>            Convert TOML to YAML for celestia-node"
	@echo "  make generate-docs                                        Generate documentation for Helm charts"
	@echo "  make upload-keys CELESTIA_NODE_VERSION=<version>          Upload keys to 1Password for celestia-node"
	@echo "  make app CELESTIA_APP_VERSION=<version>                   Run all tasks for celestia-app"
	@echo "  make node CELESTIA_NODE_VERSION=<version>                 Run all tasks for celestia-node"
	@echo "  make all CELESTIA_APP_VERSION=<version> CELESTIA_NODE_VERSION=<version> Run all tasks for both celestia-app and celestia-node"
	@echo "  make help                                                 Display this help message"
