#!/bin/bash

# Check if the correct number of arguments are provided
if [ "$#" -ne 4 ]; then
    echo "Usage: $0 <celestia-node-version> <secret-name> <vault-name> <chain>"
    exit 1
fi

# Check if Docker is installed
if ! command -v docker &> /dev/null; then
    echo "Docker is not installed. Please install Docker and try again."
    exit 1
fi

# Assign arguments to variables
CELESTIA_NODE_VERSION=$1
SECRET_NAME=$2
VAULT_NAME=$3
CHAIN=$4

# Generate unique container name
NODE_CONTAINER_NAME="celestia-node-container-$(date +%s)"

# Start the celestia-node container with the specified version and keep it running
docker run -d --name $NODE_CONTAINER_NAME --entrypoint tail ghcr.io/celestiaorg/celestia-node:$CELESTIA_NODE_VERSION -f /dev/null

# Execute the command in the celestia-node container
docker exec $NODE_CONTAINER_NAME celestia bridge init
docker exec $NODE_CONTAINER_NAME celestia bridge start

# Function to get keys from the running container and upload to 1password
upload_keys_to_1password() {
    NJ=$(docker exec $NODE_CONTAINER_NAME cat /home/celestia/.celestia-bridge/keys/NJ3XILLTMVRXEZLUFZVHO5A)
    AA=$(docker exec $NODE_CONTAINER_NAME cat /home/celestia/.celestia-bridge/keys/OAZHALLLMV4Q)
    ADDR_ID=$(docker exec $NODE_CONTAINER_NAME ls /home/celestia/.celestia-bridge/keys/keyring-test | grep address | tr '.' '_')
    ADDR_IN=$(docker exec $NODE_CONTAINER_NAME ls /home/celestia/.celestia-bridge/keys/keyring-test | grep info | tr '.' '_')
    ADDR=$(docker exec $NODE_CONTAINER_NAME bash -c "ls /home/celestia/.celestia-bridge/keys/keyring-test | grep address | xargs -I {} cat /home/celestia/.celestia-bridge/keys/keyring-test/{}")
    ADDR_INFO=$(docker exec $NODE_CONTAINER_NAME bash -c "ls /home/celestia/.celestia-bridge/keys/keyring-test | grep info | xargs -I {} cat /home/celestia/.celestia-bridge/keys/keyring-test/{}")
    ADR_ID=$(echo $ADDR_ID | cut -d '_' -f 1)

    read -p "Do you want to add the node to 1Pass? (y/n): " confirm
    case $confirm in
        [yY]|[yesYES])
            echo "Adding node to 1Pass..."
            op item create \
                --category password \
                --title "$SECRET_NAME" \
                --vault $VAULT_NAME \
                "NJ3XILLTMVRXEZLUFZVHO5A=${NJ}" \
                "OAZHALLLMV4Q=${AA}" \
                "address=${ADDR}" \
                "${ADDR_IN}=${ADDR_INFO}" \
                "id=${ADR_ID}" \
                --tags ${CHAIN},kubernetes
            ;;
        *)
            echo "Node not added to 1Pass."
            ;;
    esac
}

# Upload keys to 1password
upload_keys_to_1password

# Stop and remove the celestia-node container in the background
docker stop $NODE_CONTAINER_NAME
docker rm $NODE_CONTAINER_NAME
