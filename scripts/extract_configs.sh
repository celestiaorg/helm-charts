#!/bin/bash

# Check if the correct number of arguments are provided
if [ "$#" -ne 2 ]; then
    echo "Usage: $0 <celestia-app-version> <celestia-node-version>"
    exit 1
fi

# Check if Docker is installed
if ! command -v docker &> /dev/null; then
    echo "Docker is not installed. Please install Docker and try again."
    exit 1
fi

# Assign arguments to variables
CELESTIA_APP_VERSION=$1
CELESTIA_NODE_VERSION=$2

# Generate unique container names
APP_CONTAINER_NAME="celestia-app-container-$(date +%s)"
NODE_CONTAINER_NAME="celestia-node-container-$(date +%s)"

# Start the celestia-app container with the specified version and keep it running
docker run -d --name $APP_CONTAINER_NAME --entrypoint tail ghcr.io/celestiaorg/celestia-app:$CELESTIA_APP_VERSION -f /dev/null

# Execute the command in the celestia-app container
docker exec $APP_CONTAINER_NAME celestia-appd init app --chain-id celestia

# Create a directory named as the version in the scripts/config/app folder
SCRIPT_DIR=$(dirname "$0")
APP_CONFIG_DIR="$SCRIPT_DIR/config/app/$CELESTIA_APP_VERSION"
mkdir -p $APP_CONFIG_DIR

# Copy the config files from the celestia-app container to the folder
docker cp $APP_CONTAINER_NAME:/home/celestia/.celestia-app/config/app.toml $APP_CONFIG_DIR
docker cp $APP_CONTAINER_NAME:/home/celestia/.celestia-app/config/client.toml $APP_CONFIG_DIR
docker cp $APP_CONTAINER_NAME:/home/celestia/.celestia-app/config/config.toml $APP_CONFIG_DIR

# Stop and remove the celestia-app container in the background
docker stop $APP_CONTAINER_NAME
docker rm $APP_CONTAINER_NAME

echo "Config files for celestia-app version $CELESTIA_APP_VERSION have been extracted to $APP_CONFIG_DIR"

# Start the celestia-node container with the specified version and keep it running
docker run -d --name $NODE_CONTAINER_NAME --entrypoint tail ghcr.io/celestiaorg/celestia-node:$CELESTIA_NODE_VERSION -f /dev/null

# Execute the command in the celestia-node container
docker exec $NODE_CONTAINER_NAME celestia bridge init

# Create a directory named as the version in the scripts/config/node folder
NODE_CONFIG_DIR="$SCRIPT_DIR/config/node/$CELESTIA_NODE_VERSION"
mkdir -p $NODE_CONFIG_DIR

# Copy the config file from the celestia-node container to the folder
docker cp $NODE_CONTAINER_NAME:/home/celestia/.celestia-bridge/config.toml $NODE_CONFIG_DIR

# Stop and remove the celestia-node container in the background
docker stop $NODE_CONTAINER_NAME
docker rm $NODE_CONTAINER_NAME

echo "Config files for celestia-node version $CELESTIA_NODE_VERSION have been extracted to $NODE_CONFIG_DIR"
