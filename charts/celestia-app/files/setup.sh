#!/bin/sh
# CELESTIA_HOME should be set in the environment
# APP_ID should be set in the environment
# CHAIN_ID should be set in the environment
# INITIAL_TIA_AMOUNT should be set in the environment
# STAKING_TIA_AMOUNT should be set in the environment
# EVM_ADDRESS should be set in the environment

KEY_NAME="${APP_ID}-${CHAIN_ID}"

echo "---------------------------------------------------"
echo "Checking if the file [genesis.json] exists or not..."
echo "---------------------------------------------------"
if [[ ! -f "$CELESTIA_HOME/config/genesis.json" ]]; then
    celestia-appd init "${APP_ID}" --home "${CELESTIA_HOME}" --chain-id "${CHAIN_ID}"

   # yes n | celestia-appd keys add "${KEY_NAME}" --home "${CELESTIA_HOME}" --no-backup
    celestia-appd keys add "${KEY_NAME}" --home "${CELESTIA_HOME}" --no-backup

    account_address=$(celestia-appd keys show "${KEY_NAME}" -a --home "${CELESTIA_HOME}")
    celestia-appd add-genesis-account "${account_address}" "${INITIAL_TIA_AMOUNT}" --home "${CELESTIA_HOME}"

    celestia-appd gentx "${KEY_NAME}" "${STAKING_TIA_AMOUNT}" --home "${CELESTIA_HOME}" --chain-id "${CHAIN_ID}"

    celestia-appd collect-gentxs --home "${CELESTIA_HOME}"

    echo "Copying the keys to the config path..."
    mv $CELESTIA_HOME/config/priv_validator_key.json $CELESTIA_HOME/keys
    mv $CELESTIA_HOME/config/node_key.json $CELESTIA_HOME/keys
fi

echo "Configuration applied [$CELESTIA_HOME/config/config.toml]"
echo "---------------------------------------------------"
cat $CELESTIA_HOME/config/config.toml
echo "Configuration applied [$CELESTIA_HOME/config/app.toml]"
echo "---------------------------------------------------"
cat $CELESTIA_HOME/config/app.toml
echo "Configuration applied [$CELESTIA_HOME/config/client.toml]"
echo "---------------------------------------------------"
cat $CELESTIA_HOME/config/client.toml
