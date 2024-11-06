## `Makefile` example

> **⚠️ Warning**
> Not tested with `celestia-app` yet!

```shell
# See all commands 
make help

# Extracts config.toml for a particular celesti-node release
export CELESTIA_NODE_VERSION=v0.20.0-mocha # set the release version
make node
```

```shell
export CELESTIA_APP_VERSION=v3.0.0-mocha
make app
```

---

# scripts

## config

When a new version of the application is release, put the new version of the config files here.

### Extracting the config files

```bash
./scripts/extract_configs.sh <celestia-app-version> <celestia-node-version>
```

### Integrating to helm chart

Compare the new configs with the version of the existing configs. (You can use `git diff` for that)
If the differ then run the following two scripts for all config files.

app: `app.toml`, `client.toml`, `config.toml`
node: `config.toml`

Steps with example

1. Get the template for the `configmap.yaml`
```bash
./scripts/convert_toml_to_template.sh scripts/config/app/<celestia-app-version>/config.toml app [node_subtype]
```

2. Get the values for the `values.yaml`
```bash
./scripts/convert_toml_to_yaml.sh scripts/config/node/<celestia-app-version>/config.toml
```

