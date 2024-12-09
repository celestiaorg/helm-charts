#!/bin/bash

# Check if the correct number of arguments are provided
if [ "$#" -ne 1 ]; then
    echo "Usage: $0 <celestia-app-version>"
    exit 1
fi

VERSION=$1
SCRIPT_DIR=$(dirname "$0")
CONFIG_DIR="$SCRIPT_DIR/config/app/$VERSION"
TEMPLATE_DIR="$SCRIPT_DIR/../common-charts/common-celestia-app/templates"

# Array of config files to process
CONFIG_FILES=("app.toml" "client.toml" "config.toml")

for file in "${CONFIG_FILES[@]}"; do
    echo "Processing $file..."
    
    # Generate template using convert_toml_to_template.sh
    ./convert_toml_to_template.sh "$CONFIG_DIR/$file" "app"
    
    # Get the base name without extension
    base_name=$(basename "$file" .toml)
    
    # Create the template file name
    template_file="_${base_name}_config.toml.tpl"
    
    # Add the Helm template definition header
    echo "{{- define \"common-celestia-app.${base_name}_config.toml\" -}}" > "$TEMPLATE_DIR/$template_file"
    
    # Add the generated content, removing any empty lines at the start/end
    cat "$CONFIG_DIR/template.yaml" | sed '/^[[:space:]]*$/d' >> "$TEMPLATE_DIR/$template_file"
    
    # Add the template definition end
    echo "{{- end }}" >> "$TEMPLATE_DIR/$template_file"
    
    # Remove the temporary template.yaml file
    rm "$CONFIG_DIR/template.yaml"
    
    echo "Generated $template_file"
done

echo "All templates have been generated in $TEMPLATE_DIR"