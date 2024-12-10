#!/bin/sh

set -e

# CELESTIA_HOME should be set in the environment
# CHAIN_ID should be set in the environment
# FUND_TIA_AMOUNT should be set in the environment
# STAKING_TIA_AMOUNT should be set in the environment

# CONSENSUS_VALIDATOR_POD should be set in the environment
# CONSENSUS_VALIDATOR_NAMEPACE should be set in the environment

# CONENSUS_VALIDATOR_POD_NOMINATEES should be set in the environment

CONSENSUS_VALIDATOR_KEY_NAME="${CONSENSUS_VALIDATOR_POD}-${CHAIN_ID}"
CONTAINER_NAME="app"

# wait until validator is ready and all containers are ready
echo "---------------------------------------------------"
echo "Waiting for ${CONSENSUS_VALIDATOR_POD} to be ready..."
echo "---------------------------------------------------"
kubectl wait --for=condition=Ready pod/${CONSENSUS_VALIDATOR_POD} -n "${CONSENSUS_VALIDATOR_NAMESPACE}" --timeout=300s

for CONENSUS_VALIDATOR_POD_NOMINATEE in $(echo $CONENSUS_VALIDATOR_POD_NOMINATEES | sed "s/,/ /g")
do

    # wait until validator is ready and all containers are ready
    echo "---------------------------------------------------"
    echo "Waiting for ${CONENSUS_VALIDATOR_POD_NOMINATEE} to be ready..."
    echo "---------------------------------------------------"
    until kubectl wait --for=condition=Ready pod/${CONENSUS_VALIDATOR_POD_NOMINATEE} -n "${CONSENSUS_VALIDATOR_NAMESPACE}" --timeout=300s; do
        echo "Command timed out, retrying..."
        sleep 5
    done

    # fetch account address from nominatee
    echo "---------------------------------------------------"
    echo "Fetching account address from ${CONENSUS_VALIDATOR_POD_NOMINATEE}"
    echo "---------------------------------------------------"
    # Extract the desired part of the string, the key name is different than the pod name
    validator_name=$(echo "${CONENSUS_VALIDATOR_POD_NOMINATEE}" | cut -d'-' -f1-3)
    fetch_address_command="celestia-appd keys show ${validator_name}-0-${CHAIN_ID} -a --home ${CELESTIA_HOME}"

    echo $fetch_address_command
    nominatee_address=$(kubectl -n ${CONSENSUS_VALIDATOR_NAMESPACE} exec -t ${CONENSUS_VALIDATOR_POD_NOMINATEE} --container=${CONTAINER_NAME} -- /bin/sh -c "${fetch_address_command}")
    echo "nominatee_address: ${nominatee_address}"

    # fetch validator address from nominatee
    echo "---------------------------------------------------"
    echo "Fetching validator address from ${CONENSUS_VALIDATOR_POD_NOMINATEE}"
    echo "---------------------------------------------------"
    fetch_validator_address_command="celestia-appd keys show ${validator_name}-0-${CHAIN_ID} -a --bech val --home ${CELESTIA_HOME}"

    echo $fetch_validator_address_command
    validator_address=$(kubectl -n ${CONSENSUS_VALIDATOR_NAMESPACE} exec -t ${CONENSUS_VALIDATOR_POD_NOMINATEE} --container=${CONTAINER_NAME} -- /bin/sh -c "${fetch_validator_address_command}")
    echo "validator_address: ${validator_address}"

    # fetch validator pubkey from nominatee
    echo "---------------------------------------------------"
    echo "Fetching validator pubkey from ${CONENSUS_VALIDATOR_POD_NOMINATEE}"
    echo "---------------------------------------------------"
    fetch_pubkey_command="celestia-appd tendermint show-validator --home ${CELESTIA_HOME}"

    echo $fetch_pubkey_command
    nominatee_pubkey=$(kubectl -n ${CONSENSUS_VALIDATOR_NAMESPACE} exec -t ${CONENSUS_VALIDATOR_POD_NOMINATEE} --container=${CONTAINER_NAME} -- /bin/sh -c "${fetch_pubkey_command}")
    echo "nominatee_pubkey: ${nominatee_pubkey}"

    # check if nominatee is already a validator
    echo "---------------------------------------------------"
    echo "Checking if ${CONENSUS_VALIDATOR_POD_NOMINATEE} is already a validator"
    echo "---------------------------------------------------"
    status_command="celestia-appd query staking validator ${validator_address} --chain-id ${CHAIN_ID} --home ${CELESTIA_HOME}"

    echo $status_command
    if kubectl -n ${CONSENSUS_VALIDATOR_NAMESPACE} exec -t ${CONENSUS_VALIDATOR_POD_NOMINATEE} --container=${CONTAINER_NAME} -- /bin/sh -c "${status_command}" > /dev/null 2>&1; then
        echo "${CONENSUS_VALIDATOR_POD_NOMINATEE} is already a validator, skipping..."
        continue
    fi

    # fund nominatee from validator
    echo "---------------------------------------------------"
    echo "Funding ${CONENSUS_VALIDATOR_POD_NOMINATEE} from ${CONSENSUS_VALIDATOR_POD}"
    echo "---------------------------------------------------"
    send_command="celestia-appd tx bank send \
        ${CONSENSUS_VALIDATOR_KEY_NAME} \
        ${nominatee_address} \
        ${FUND_TIA_AMOUNT} \
        --chain-id ${CHAIN_ID} \
        --fees 22000utia \
        --home ${CELESTIA_HOME} \
        --yes"

    echo $send_command
    kubectl -n ${CONSENSUS_VALIDATOR_NAMESPACE} exec -t ${CONSENSUS_VALIDATOR_POD} --container=${CONTAINER_NAME} -- /bin/sh -c "${send_command}"

    sleep 15

    # make nominatee a validator
    echo "---------------------------------------------------"
    echo "Making ${CONENSUS_VALIDATOR_POD_NOMINATEE} a validator"
    echo "---------------------------------------------------"
    stake_command="celestia-appd tx staking create-validator \
        --amount ${STAKING_TIA_AMOUNT} \
        --pubkey '${nominatee_pubkey}' \
        --moniker ${CONENSUS_VALIDATOR_POD_NOMINATEE}-${CHAIN_ID} \
        --chain-id ${CHAIN_ID} \
        --commission-rate 0.1 \
        --commission-max-rate 0.2 \
        --commission-max-change-rate 0.01 \
        --min-self-delegation 1000000 \
        --from ${CONENSUS_VALIDATOR_POD_NOMINATEE}-${CHAIN_ID} \
        --keyring-backend test \
        --fees 21000utia \
        --home ${CELESTIA_HOME} \
        --yes"

    echo $stake_command
    kubectl -n ${CONSENSUS_VALIDATOR_NAMESPACE} exec -t ${CONENSUS_VALIDATOR_POD_NOMINATEE} --container=${CONTAINER_NAME} -- /bin/sh -c "${stake_command}"
done

# I'm done and wait forever
echo "---------------------------------------------------"
echo "I'm done and wait forever"
echo "---------------------------------------------------"
sleep infinity
