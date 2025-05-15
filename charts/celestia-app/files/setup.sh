#!/bin/sh
# CELESTIA_APP_HOME should be set in the environment
# APP_ID should be set in the environment
# CHAIN_ID should be set in the environment
# INITIAL_TIA_AMOUNT should be set in the environment
# STAKING_TIA_AMOUNT should be set in the environment
# EVM_ADDRESS should be set in the environment

KEY_NAME="${APP_ID}-${CHAIN_ID}"

echo "---------------------------------------------------"
echo "Checking if the file [genesis.json] exists or not..."
echo "---------------------------------------------------"
if [[ ! -f "$CELESTIA_APP_HOME/config/genesis.json" ]]; then
    celestia-appd init "${APP_ID}" --home "${CELESTIA_APP_HOME}" --chain-id "${CHAIN_ID}"

   # yes n | celestia-appd keys add "${KEY_NAME}" --home "${CELESTIA_APP_HOME}" --no-backup
    celestia-appd keys add "${KEY_NAME}" --home "${CELESTIA_APP_HOME}" --no-backup

    account_address=$(celestia-appd keys show "${KEY_NAME}" -a --home "${CELESTIA_APP_HOME}")
    celestia-appd add-genesis-account "${account_address}" "${INITIAL_TIA_AMOUNT}" --home "${CELESTIA_APP_HOME}"

    celestia-appd gentx "${KEY_NAME}" "${STAKING_TIA_AMOUNT}" --home "${CELESTIA_APP_HOME}" --chain-id "${CHAIN_ID}"

    celestia-appd collect-gentxs --home "${CELESTIA_APP_HOME}"

    echo "Copying the keys to the config path..."
    mv $CELESTIA_APP_HOME/config/priv_validator_key.json $CELESTIA_APP_HOME/keys
    mv $CELESTIA_APP_HOME/config/node_key.json $CELESTIA_APP_HOME/keys
fi

echo "Configuration applied [$CELESTIA_APP_HOME/config/config.toml]"
echo "---------------------------------------------------"
cat $CELESTIA_APP_HOME/config/config.toml
echo "Configuration applied [$CELESTIA_APP_HOME/config/app.toml]"
echo "---------------------------------------------------"
cat $CELESTIA_APP_HOME/config/app.toml
echo "Configuration applied [$CELESTIA_APP_HOME/config/client.toml]"
echo "---------------------------------------------------"
cat $CELESTIA_APP_HOME/config/client.toml
