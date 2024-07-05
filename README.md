# helm-charts

Celestia Helm Charts

## Add the celestiaorg helm repository

```bash
helm repo add celestiaorg https://celestiaorg.github.io/helm-charts/
```

## Versions

Please check the helm repository to check which version you need to deploy.

```bash
helm search repo celestiaorg
```

## Installation

Please make sure you have created the namespace before installing the chart.

```bash
kubectl create namespace celestia
```

### Install the celestia-app chart

Install a celestia consensus full node against the mocha testnet.

```bash
helm install celestia-app celestiaorg/celestia-app --namespace celestia --values examples/celestia-node/mocha.yaml
```

### Install the celestia-node chart

Install a celestia bridge node against the mocha testnet.

```bash
helm install celestia-node-bridge celestiaorg/celestia-node --namespace celestia --values examples/celestia-node/mocha.yaml
```
