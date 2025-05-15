# celestia-app

![Version: 0.4.3](https://img.shields.io/badge/Version-0.4.3-informational?style=flat-square) ![AppVersion: v4.0.0](https://img.shields.io/badge/AppVersion-v4.0.0-informational?style=flat-square)

Celestia App

**Homepage:** <https://celestia.org>

## Maintainers

| Name | Email | Url |
| ---- | ------ | --- |
| Celestia Labs |  | <https://github.com/celestiaorg/helm-charts> |

## Source Code

* <https://github.com/celestiaorg/celestia-app>

## Requirements

| Repository | Name | Version |
|------------|------|---------|
| https://celestiaorg.github.io/helm-charts | common-celestia-app | 0.2.0 |
| oci://registry-1.docker.io/bitnamicharts | common | 2.x.x |

## Values

| Key | Type | Default | Description |
|-----|------|---------|-------------|
| app.affinity | object | `{}` |  |
| app.args[0] | string | `"start"` |  |
| app.args[1] | string | `"--home"` |  |
| app.args[2] | string | `"$(CELESTIA_APP_HOME)"` |  |
| app.automountServiceAccountToken | bool | `false` | mount service account token in app pods |
| app.command | list | `["celestia-appd"]` | command for the celestia-app |
| app.config.app | object | `{"api":{"address":"tcp://localhost:1317","enable":false,"enabled_unsafe_cors":false,"max_open_connections":1000,"rpc_max_body_bytes":1000000,"rpc_read_timeout":10,"rpc_write_timeout":0,"swagger":false},"app_db_backend":"","grpc":{"address":"localhost:9090","enable":false,"max_recv_msg_size":"20971520","max_send_msg_size":"2147483647"},"grpc_web":{"enable":false},"halt_height":0,"halt_time":0,"iavl_cache_size":781250,"iavl_disable_fastnode":false,"index_events":[],"inter_block_cache":true,"mempool":{"max_txs":-1},"min_retain_blocks":0,"minimum_gas_prices":"0.002utia","pruning":"default","pruning_interval":"0","pruning_keep_recent":"0","query_gas_limit":"0","state_sync":{"snapshot_interval":1500,"snapshot_keep_recent":2},"streaming":{"abci":{"keys":[],"plugin":"","stop_node_on_err":true}},"telemetry":{"datadog_hostname":"","enable_hostname":false,"enable_hostname_label":false,"enable_service_label":false,"enabled":false,"global_labels":[],"metrics_sink":"","prometheus_retention_time":0,"service_name":"","statsd_addr":""}}` | configuration for the celestia-app app.toml |
| app.config.client | object | `{"broadcast_mode":"sync","chain_id":"celestia","keyring_backend":"os","node":"tcp://localhost:26657","output":"text"}` | configuration for the celestia-app client.toml |
| app.config.config | object | `{"abci":"socket","blocksync":{"version":"v0"},"consensus":{"create_empty_blocks":true,"create_empty_blocks_interval":"0s","double_sign_check_height":0,"only_internal_wal":"true","peer_gossip_sleep_duration":"100ms","peer_query_maj23_sleep_duration":"2s","skip_timeout_commit":false,"timeout_commit":"4.2s","timeout_precommit":"1s","timeout_precommit_delta":"500ms","timeout_prevote":"1s","timeout_prevote_delta":"500ms","timeout_propose":"3.5s","timeout_propose_delta":"500ms","wal_file":"data/cs.wal/wal"},"db_backend":"goleveldb","db_dir":"data","filter_peers":false,"genesis_file":"config/genesis.json","instrumentation":{"max_open_connections":3,"namespace":"cometbft","prometheus":false,"prometheus_listen_addr":":26660","pyroscope_profile_types":["cpu","alloc_objects","inuse_objects","goroutines","mutex_count","mutex_duration","block_count","block_duration"],"pyroscope_trace":false,"pyroscope_url":"","trace_pull_address":"","trace_push_batch_size":1000,"trace_push_config":"","trace_type":"noop","tracing_tables":"mempool_tx,mempool_peer_state,consensus_round_state,consensus_block_parts,consensus_block,consensus_vote,consensus_state,consensus_proposal,peers,pending_bytes,received_bytes,abci"},"log_format":"plain","log_level":"info","mempool":{"broadcast":true,"cache_size":10000,"experimental_max_gossip_connections_to_non_persistent_peers":0,"experimental_max_gossip_connections_to_persistent_peers":0,"keep_invalid_txs_in_cache":false,"max_batch_bytes":0,"max_gossip_delay":"0s","max_tx_bytes":2097152,"max_txs_bytes":83886080,"recheck":true,"recheck_timeout":"1s","size":5000,"ttl_duration":"1m15s","ttl_num_blocks":12,"type":"priority","wal_dir":""},"moniker":"app","node_key_file":"config/node_key.json","p2p":{"addr_book_file":"config/addrbook.json","addr_book_strict":true,"allow_duplicate_ip":false,"dial_timeout":"3s","external_address":"","flush_throttle_timeout":"100ms","handshake_timeout":"20s","laddr":"tcp://0.0.0.0:26656","max_num_inbound_peers":40,"max_num_outbound_peers":10,"max_packet_msg_payload_size":1024,"persistent_peers":"","persistent_peers_max_dial_period":"0s","pex":true,"private_peer_ids":"","recv_rate":10485760,"seed_mode":false,"seeds":"","send_rate":10485760,"unconditional_peer_ids":""},"priv_validator_key_file":"config/priv_validator_key.json","priv_validator_laddr":"","priv_validator_state_file":"data/priv_validator_state.json","proxy_app":"tcp://127.0.0.1:26658","rpc":{"cors_allowed_headers":["Origin","Accept","Content-Type","X-Requested-With","X-Server-Time"],"cors_allowed_methods":["HEAD","GET","POST"],"cors_allowed_origins":[],"experimental_close_on_slow_client":false,"experimental_subscription_buffer_size":200,"experimental_websocket_write_buffer_size":200,"grpc_laddr":"tcp://127.0.0.1:9098","grpc_max_open_connections":900,"laddr":"tcp://127.0.0.1:26657","max_body_bytes":8388608,"max_header_bytes":1048576,"max_open_connections":900,"max_request_batch_size":10,"max_subscription_clients":100,"max_subscriptions_per_client":5,"pprof_laddr":"localhost:6060","timeout_broadcast_tx_commit":"50s","tls_cert_file":"","tls_key_file":"","unsafe":false},"statesync":{"chunk_fetchers":"4","chunk_request_timeout":"10s","discovery_time":"15s","enable":false,"rpc_servers":"","temp_dir":"","trust_hash":"","trust_height":0,"trust_period":"168h0m0s"},"storage":{"discard_abci_responses":true},"tx_index":{"indexer":"null","psql_conn":""},"version":"0.38.17"}` | configuration for the celestia-app config.toml |
| app.configFiles.app.enabled | bool | `true` |  |
| app.configFiles.app.mountPath | string | `"/home/celestia/config/app.toml"` |  |
| app.configFiles.client.enabled | bool | `true` |  |
| app.configFiles.client.mountPath | string | `"/home/celestia/config/client.toml"` |  |
| app.configFiles.config.enabled | bool | `true` |  |
| app.configFiles.config.mountPath | string | `"/home/celestia/config/config.toml"` |  |
| app.containerPorts | object | `{"api":1317,"grpc":9090,"p2p":26656,"prometheus":26660,"rpc":26657,"tracing":26661}` | container ports for the app |
| app.containerPorts.api | int | `1317` | API container port, 1317 by default |
| app.containerPorts.grpc | int | `9090` | gRPC container port, 9090 by default |
| app.containerPorts.p2p | int | `26656` | P2P container port, 26656 by default |
| app.containerPorts.prometheus | int | `26660` | Prometheus container port, 26660 by default |
| app.containerPorts.rpc | int | `26657` | RPC container port, 26657 by default |
| app.containerPorts.tracing | int | `26661` | Tracing container port, 26661 by default |
| app.containerSecurityContext | object | `{"allowPrivilegeEscalation":false,"capabilities":{"drop":["ALL"]},"enabled":true,"privileged":false,"readOnlyRootFilesystem":true,"runAsGroup":10001,"runAsNonRoot":true,"runAsUser":10001,"seLinuxOptions":{},"seccompProfile":{"type":"RuntimeDefault"}}` | container security context for the app |
| app.containerSecurityContext.allowPrivilegeEscalation | bool | `false` | allowPrivilegeEscalation in app container, false by default |
| app.containerSecurityContext.capabilities | object | `{"drop":["ALL"]}` | capabilities to be dropped in app container, ["ALL"] by default |
| app.containerSecurityContext.enabled | bool | `true` | enable container security context for the app, true by default |
| app.containerSecurityContext.privileged | bool | `false` | privileged in app container, false by default |
| app.containerSecurityContext.readOnlyRootFilesystem | bool | `true` | readOnlyRootFilesystem in app container, true by default |
| app.containerSecurityContext.runAsGroup | int | `10001` | runAsGroup in app container, 10001 by default |
| app.containerSecurityContext.runAsNonRoot | bool | `true` | runAsNonRoot in app container, true by default |
| app.containerSecurityContext.runAsUser | int | `10001` | runAsUser in app container, 10001 by default |
| app.containerSecurityContext.seLinuxOptions | object | `{}` | SELinux options in app container, {} by default |
| app.containerSecurityContext.seccompProfile | object | `{"type":"RuntimeDefault"}` | seccomp profile in app container, RuntimeDefault by default |
| app.customLivenessProbe | object | `{}` |  |
| app.customReadinessProbe | object | `{}` |  |
| app.customStartupProbe | object | `{}` |  |
| app.daemonsetAnnotations | object | `{}` |  |
| app.deploymentAnnotations | object | `{}` |  |
| app.existingConfigmap | string | `nil` |  |
| app.extraEnvVars | list | `[]` |  |
| app.extraEnvVarsCM | string | `""` |  |
| app.extraEnvVarsSecret | string | `""` |  |
| app.extraVolumeMounts | list | `[]` |  |
| app.extraVolumes | list | `[]` |  |
| app.hostAliases | list | `[]` |  |
| app.image | object | `{"digest":"","pullPolicy":"IfNotPresent","pullSecrets":[],"registry":"ghcr.io","repository":"celestiaorg/celestia-app","tag":"v3.7.0"}` | image parameters for the image |
| app.image.pullPolicy | string | `"IfNotPresent"` | pull policy for the image, IfNotPresent by default |
| app.image.registry | string | `"ghcr.io"` | registry for the image, GitHub Container Registry by default |
| app.image.repository | string | `"celestiaorg/celestia-app"` | repository for the image, celestiaorg/celestia-app by default |
| app.image.tag | string | `"v3.7.0"` | tag for the image, v3.0.0 by default |
| app.initContainers | list | `[]` |  |
| app.lifecycleHooks | object | `{}` |  |
| app.livenessProbe | object | `{"enabled":false,"failureThreshold":3,"initialDelaySeconds":0,"periodSeconds":10,"successThreshold":1,"timeoutSeconds":1}` | liveness probe for the app |
| app.livenessProbe.enabled | bool | `false` | enable liveness probe on app containers, false by default |
| app.livenessProbe.failureThreshold | int | `3` | failure threshold for livenessProbe, 3 by default |
| app.livenessProbe.initialDelaySeconds | int | `0` | initial delay seconds for livenessProbe, 0 by default |
| app.livenessProbe.periodSeconds | int | `10` | period seconds for livenessProbe, 10 by default |
| app.livenessProbe.successThreshold | int | `1` | success threshold for livenessProbe, 1 by default |
| app.livenessProbe.timeoutSeconds | int | `1` | timeout seconds for livenessProbe, 1 by default |
| app.metrics.enabled | bool | `true` |  |
| app.metrics.serviceMonitor.annotations | object | `{}` |  |
| app.metrics.serviceMonitor.enabled | bool | `true` |  |
| app.metrics.serviceMonitor.honorLabels | bool | `false` |  |
| app.metrics.serviceMonitor.interval | string | `""` |  |
| app.metrics.serviceMonitor.jobLabel | string | `""` |  |
| app.metrics.serviceMonitor.labels | object | `{}` |  |
| app.metrics.serviceMonitor.metricRelabelings | list | `[]` |  |
| app.metrics.serviceMonitor.namespace | string | `""` |  |
| app.metrics.serviceMonitor.relabelings | list | `[]` |  |
| app.metrics.serviceMonitor.scrapeTimeout | string | `""` |  |
| app.metrics.serviceMonitor.selector | object | `{}` |  |
| app.networkPolicy | with the correct destination port | `{"allowExternal":true,"allowExternalEgress":true,"enabled":true,"extraEgress":[],"extraIngress":[],"ingressNSMatchLabels":{},"ingressNSPodMatchLabels":{}}` | . |
| app.networkPolicy.enabled | bool | `true` | enable network policy, true by default |
| app.nodeAffinityPreset.key | string | `""` |  |
| app.nodeAffinityPreset.type | string | `""` |  |
| app.nodeAffinityPreset.values | list | `[]` |  |
| app.nodeSelector | object | `{}` |  |
| app.otelAgent.config.exporters.otlphttp.endpoint | string | `"https://otel.arabica.celestia.dev"` |  |
| app.otelAgent.config.exporters.prometheus.endpoint | string | `"0.0.0.0:9191"` |  |
| app.otelAgent.config.processors.batch | string | `nil` |  |
| app.otelAgent.config.processors.memory_limiter.check_interval | string | `"5s"` |  |
| app.otelAgent.config.processors.memory_limiter.limit_mib | int | `400` |  |
| app.otelAgent.config.processors.memory_limiter.spike_limit_mib | int | `100` |  |
| app.otelAgent.config.receivers.otlp.protocols.http.endpoint | string | `"localhost:4318"` |  |
| app.otelAgent.config.receivers.prometheus.config.scrape_configs[0].job_name | string | `"$CONTAINER_NAME-$POD_NAMESPACE"` |  |
| app.otelAgent.config.receivers.prometheus.config.scrape_configs[0].scrape_interval | string | `"10s"` |  |
| app.otelAgent.config.receivers.prometheus.config.scrape_configs[0].static_configs[0].targets[0] | string | `"localhost:26660"` |  |
| app.otelAgent.config.service.pipelines.metrics.exporters[0] | string | `"otlphttp"` |  |
| app.otelAgent.config.service.pipelines.metrics.exporters[1] | string | `"prometheus"` |  |
| app.otelAgent.config.service.pipelines.metrics.receivers[0] | string | `"otlp"` |  |
| app.otelAgent.config.service.pipelines.metrics.receivers[1] | string | `"prometheus"` |  |
| app.otelAgent.config.service.pipelines.traces.exporters[0] | string | `"otlphttp"` |  |
| app.otelAgent.config.service.pipelines.traces.processors[0] | string | `"memory_limiter"` |  |
| app.otelAgent.config.service.pipelines.traces.processors[1] | string | `"batch"` |  |
| app.otelAgent.config.service.pipelines.traces.receivers[0] | string | `"otlp"` |  |
| app.otelAgent.config.service.telemetry.metrics.address | string | `"0.0.0.0:8888"` |  |
| app.otelAgent.config.service.telemetry.metrics.level | string | `"basic"` |  |
| app.otelAgent.enabled | bool | `false` | enable otel agent for the app, false by default |
| app.otelAgent.image | object | `{"digest":"","pullPolicy":"IfNotPresent","registry":"ghcr.io","repository":"open-telemetry/opentelemetry-collector-releases/opentelemetry-collector-contrib","tag":"0.102.0"}` | image for the otel agent, ghcr.io/open-telemetry/opentelemetry-collector-releases/opentelemetry-collector-contrib:0.102.0 by default |
| app.otelAgent.resources | object | `{"grafanaOtelSecret":{"name":"SET_IT"},"limits":{},"requests":{"cpu":2,"memory":"4Gi"}}` | resources for the app |
| app.otelAgent.resources.grafanaOtelSecret | object | `{"name":"SET_IT"}` | grafana otel secret |
| app.otelAgent.resources.grafanaOtelSecret.name | string | `"SET_IT"` | name of the grafana otel secret, it must be set |
| app.otelAgent.resources.limits | object | `{}` | limits for the node |
| app.otelAgent.resources.requests | object | `{"cpu":2,"memory":"4Gi"}` | requests for the app |
| app.otelAgent.resources.requests.cpu | int | `2` | cpu requests for the node, 6 by default |
| app.otelAgent.resources.requests.memory | string | `"4Gi"` | memory requests for the node, 8Gi by default |
| app.otelAgent.resourcesPreset | string | `"micro"` |  |
| app.pdb.create | bool | `false` |  |
| app.pdb.maxUnavailable | string | `""` |  |
| app.pdb.minAvailable | int | `1` |  |
| app.persistence | object | `{"accessModes":["ReadWriteOnce"],"annotations":{},"dataSource":{"apiGroup":"snapshot.storage.k8s.io","kind":"VolumeSnapshot","name":"consensus-latest-2"},"enabled":true,"existingClaim":"","mountPath":"/data","selector":{},"size":"500Gi","storageClass":"sbs-5k-retain","subPath":""}` | persistence parameters |
| app.persistence.enabled | bool | `true` | enable persistence, true by default |
| app.persistence.size | string | `"500Gi"` | size of data volume, 250Gi by default |
| app.persistentVolumeClaimRetentionPolicy.whenDeleted | string | `"Retain"` |  |
| app.persistentVolumeClaimRetentionPolicy.whenScaled | string | `"Retain"` |  |
| app.podAffinityPreset | string | `""` |  |
| app.podAnnotations | object | `{}` |  |
| app.podAntiAffinityPreset | string | `"soft"` |  |
| app.podLabels | object | `{}` |  |
| app.podManagementPolicy | string | `"OrderedReady"` |  |
| app.podName | string | `"consensus-validator-1-0"` | used to generate the keyring file name |
| app.podSecurityContext | object | `{"enabled":true,"fsGroup":10001,"fsGroupChangePolicy":"Always","supplementalGroups":[],"sysctls":[]}` | pod security context for the app |
| app.podSecurityContext.enabled | bool | `true` | enable pod security context for the app, true by default |
| app.podSecurityContext.fsGroup | int | `10001` | fsGroup in app pods' Security Context, 10001 by default |
| app.podSecurityContext.fsGroupChangePolicy | string | `"Always"` | filesystem group change policy for app pods, Always by default |
| app.podSecurityContext.supplementalGroups | list | `[]` | filesystem extra groups for app pods, [] by default |
| app.podSecurityContext.sysctls | list | `[]` | kernel settings using the sysctl interface for app pods, [] by default |
| app.priorityClassName | string | `""` |  |
| app.rbac.create | bool | `true` |  |
| app.rbac.rules | list | `[]` |  |
| app.readinessProbe.enabled | bool | `false` | enable readiness probe on app containers, false by default |
| app.readinessProbe.failureThreshold | int | `3` | failure threshold for readinessProbe, 3 by default |
| app.readinessProbe.initialDelaySeconds | int | `0` | initial delay seconds for readinessProbe, 0 by default |
| app.readinessProbe.periodSeconds | int | `10` | period seconds for readinessProbe, 10 by default |
| app.readinessProbe.successThreshold | int | `1` | success threshold for readinessProbe, 1 by default |
| app.readinessProbe.timeoutSeconds | int | `1` | timeout seconds for readinessProbe, 1 by default |
| app.replicaCount | int | `1` | number of app replicas to deploy, 1 by default |
| app.resourcesPreset | string | `"nano"` | more information: https://github.com/bitnami/charts/blob/main/bitnami/common/templates/_resources.tpl#L15 |
| app.schedulerName | string | `""` |  |
| app.service | object | `{"external":{"annotations":{},"enabled":true,"externalDNS":{"enabled":true,"hostname":"validator-1.celestia-arabica-11.com"},"externalTrafficPolicy":"Cluster","extraPorts":[],"loadBalancerIP":"","loadBalancerSourceRanges":[],"nodePorts":{"api":"","grpc":"","p2p":"","prometheus":"","rpc":"","tracing":""},"ports":{"api":1317,"grpc":9090,"p2p":26656,"rpc":26657},"sessionAffinity":"None","sessionAffinityConfig":{},"type":"LoadBalancer"},"internal":{"annotations":{},"clusterIP":"","ports":{"api":1317,"grpc":9090,"p2p":26656,"prometheus":26660,"rpc":26657,"tracing":26661},"sessionAffinity":"None","sessionAffinityConfig":{},"type":"ClusterIP"}}` | service parameters |
| app.service.external | object | `{"annotations":{},"enabled":true,"externalDNS":{"enabled":true,"hostname":"validator-1.celestia-arabica-11.com"},"externalTrafficPolicy":"Cluster","extraPorts":[],"loadBalancerIP":"","loadBalancerSourceRanges":[],"nodePorts":{"api":"","grpc":"","p2p":"","prometheus":"","rpc":"","tracing":""},"ports":{"api":1317,"grpc":9090,"p2p":26656,"rpc":26657},"sessionAffinity":"None","sessionAffinityConfig":{},"type":"LoadBalancer"}` | external service parameters |
| app.service.external.enabled | bool | `true` | enable external service, true by default |
| app.service.external.externalDNS.enabled | bool | `true` | enable external DNS, false by default |
| app.service.external.externalDNS.hostname | string | `"validator-1.celestia-arabica-11.com"` | hostname for the external DNS |
| app.service.external.nodePorts | object | `{"api":"","grpc":"","p2p":"","prometheus":"","rpc":"","tracing":""}` | node ports for the celestia-app |
| app.service.external.nodePorts.api | string | `""` | api port, 1317 by default |
| app.service.external.nodePorts.grpc | string | `""` | grpc port, 9090 by default |
| app.service.external.nodePorts.p2p | string | `""` | p2p port, 26656 by default |
| app.service.external.nodePorts.prometheus | string | `""` | prometheus port, 26660 by default |
| app.service.external.nodePorts.rpc | string | `""` | rpc port, 26657 by default |
| app.service.external.nodePorts.tracing | string | `""` | tracing port, 26661 by default |
| app.service.external.ports.api | int | `1317` | api port, 1317 by default |
| app.service.external.ports.grpc | int | `9090` | grpc port, 9090 by default |
| app.service.external.ports.p2p | int | `26656` | p2p port, 26656 by default |
| app.service.external.ports.rpc | int | `26657` | rpc port, 26657 by default |
| app.service.external.type | string | `"LoadBalancer"` | external service type, LoadBalancer by default |
| app.service.internal | object | `{"annotations":{},"clusterIP":"","ports":{"api":1317,"grpc":9090,"p2p":26656,"prometheus":26660,"rpc":26657,"tracing":26661},"sessionAffinity":"None","sessionAffinityConfig":{},"type":"ClusterIP"}` | service type, ClusterIP by default |
| app.service.internal.ports | object | `{"api":1317,"grpc":9090,"p2p":26656,"prometheus":26660,"rpc":26657,"tracing":26661}` | ports for the celestia-app |
| app.service.internal.ports.api | int | `1317` | api port, 1317 by default |
| app.service.internal.ports.grpc | int | `9090` | grpc port, 9090 by default |
| app.service.internal.ports.p2p | int | `26656` | p2p port, 26656 by default |
| app.service.internal.ports.prometheus | int | `26660` | prometheus port, 26660 by default |
| app.service.internal.ports.rpc | int | `26657` | rpc port, 26657 by default |
| app.service.internal.ports.tracing | int | `26661` | tracing port, 26661 by default |
| app.serviceAccount.annotations | object | `{}` |  |
| app.serviceAccount.automountServiceAccountToken | bool | `true` |  |
| app.serviceAccount.create | bool | `true` |  |
| app.serviceAccount.name | string | `"cons-sa-validator-1"` |  |
| app.settings.generateNewKeys | bool | `false` |  |
| app.settings.genesisURL | string | `"https://raw.githubusercontent.com/celestiaorg/networks/master/arabica-11/genesis.json"` | genesis URL for the celestia-app, it must be set |
| app.settings.home | string | `"/home/celestia"` | home directory for the celestia-app, defaults to /home/celestia |
| app.settings.network | string | `"arabica"` |  |
| app.settings.secret.enabled | bool | `true` | enable the secret, true by default |
| app.settings.secret.items[0].key | string | `"priv_validator_key_json"` |  |
| app.settings.secret.items[0].path | string | `"priv_validator_key_json"` |  |
| app.settings.secret.items[1].key | string | `"node_key_json"` |  |
| app.settings.secret.items[1].path | string | `"node_key_json"` |  |
| app.settings.secret.items[2].key | string | `"consensus_validator_1_0_arabica_11_info"` |  |
| app.settings.secret.items[2].path | string | `"consensus_validator_info"` |  |
| app.settings.secret.items[3].key | string | `"50a1ecc6670c9a721f267e08cd7b2bbb22fde6c8_address"` |  |
| app.settings.secret.items[3].path | string | `"address"` |  |
| app.settings.secret.items[4].key | string | `"id"` |  |
| app.settings.secret.items[4].path | string | `"id"` |  |
| app.settings.secret.name | string | `"keys-consensus-validator-1-arabica-11"` | name of the secret, it must be set |
| app.setup.enabled | bool | `false` |  |
| app.setup.env[0].name | string | `"EVM_ADDRESS"` |  |
| app.setup.env[0].valueFrom.secretKeyRef.key | string | `"evm"` |  |
| app.setup.env[0].valueFrom.secretKeyRef.name | string | `"evm-addr-1"` |  |
| app.setup.env[1].name | string | `"INITIAL_TIA_AMOUNT"` |  |
| app.setup.env[1].value | string | `"1000000000000000utia"` |  |
| app.setup.env[2].name | string | `"STAKING_TIA_AMOUNT"` |  |
| app.setup.env[2].value | string | `"100000000000000utia"` |  |
| app.setup.env[3].name | string | `"CHAIN_ID"` |  |
| app.setup.env[3].value | string | `"arabica-11"` |  |
| app.setup.env[4].name | string | `"APP_ID"` |  |
| app.setup.env[4].valueFrom.fieldRef.fieldPath | string | `"metadata.name"` |  |
| app.sidecars | list | `[]` |  |
| app.startupProbe | object | `{"enabled":false,"initialDelaySeconds":0,"periodSeconds":10,"successThreshold":1,"timeoutSeconds":1}` | startup probe for the app |
| app.startupProbe.enabled | bool | `false` | enable startup probe on app containers, false by default |
| app.startupProbe.initialDelaySeconds | int | `0` | initial delay seconds for startupProbe, 0 by default |
| app.startupProbe.periodSeconds | int | `10` | period seconds for startupProbe, 10 by default |
| app.startupProbe.successThreshold | int | `1` | failure threshold for startupProbe, 3 by default |
| app.startupProbe.timeoutSeconds | int | `1` | timeout seconds for startupProbe, 1 by default |
| app.statefulsetAnnotations | object | `{}` |  |
| app.terminationGracePeriodSeconds | string | `""` |  |
| app.tolerations | list | `[]` |  |
| app.topologySpreadConstraints | list | `[]` |  |
| app.updateStrategy.type | string | `"RollingUpdate"` |  |
| app.valMaker.celestiaAppHome | string | `"/home/celestia/.celestia-app"` |  |
| app.valMaker.chainId | string | `"arabica-11"` |  |
| app.valMaker.enabled | bool | `false` | enable the valMaker, false by default |
| app.valMaker.fundAmount | string | `"110000000000000utia"` |  |
| app.valMaker.image.pullPolicy | string | `"IfNotPresent"` |  |
| app.valMaker.image.repository | string | `"bitnami/kubectl"` |  |
| app.valMaker.image.tag | string | `"latest"` |  |
| app.valMaker.nominatees | string | `"consensus-validator-2-celestia-app-0,consensus-validator-3-celestia-app-0,consensus-validator-4-celestia-app-0"` |  |
| app.valMaker.stakingAmount | string | `"100000000000000utia"` |  |
| app.valMaker.validatorPod | string | `"consensus-validator-1-0"` |  |
| app.volumePermissions.containerSecurityContext.enabled | bool | `true` |  |
| app.volumePermissions.containerSecurityContext.runAsUser | int | `0` |  |
| app.volumePermissions.containerSecurityContext.seLinuxOptions | object | `{}` |  |
| app.volumePermissions.enabled | bool | `true` |  |
| app.volumePermissions.image.pullPolicy | string | `"IfNotPresent"` |  |
| app.volumePermissions.image.pullSecrets | list | `[]` |  |
| app.volumePermissions.image.registry | string | `"docker.io"` |  |
| app.volumePermissions.image.repository | string | `"bitnami/os-shell"` |  |
| app.volumePermissions.image.tag | string | `"12-debian-12-r22"` |  |
| app.volumePermissions.resources | object | `{}` |  |
| app.volumePermissions.resourcesPreset | string | `"nano"` |  |
| clusterDomain | string | `"cluster.local"` |  |
| commonAnnotations | object | `{}` |  |
| commonLabels | object | `{}` |  |
| diagnosticMode.args[0] | string | `"infinity"` |  |
| diagnosticMode.command[0] | string | `"sleep"` |  |
| diagnosticMode.enabled | bool | `false` |  |
| extraDeploy | list | `[]` |  |
| fullnameOverride | string | `""` |  |
| global.compatibility.openshift.adaptSecurityContext | string | `"auto"` |  |
| global.imagePullSecrets | list | `[]` |  |
| global.imageRegistry | string | `""` |  |
| global.skipValidationWarnings | bool | `false` |  |
| global.storageClass | string | `""` |  |
| kubeVersion | string | `""` |  |
| nameOverride | string | `""` |  |
| namespaceOverride | string | `""` |  |

----------------------------------------------
Autogenerated from chart metadata using [helm-docs v1.14.2](https://github.com/norwoodj/helm-docs/releases/v1.14.2)
