# celestia-app

![Version: 0.3.1](https://img.shields.io/badge/Version-0.3.1-informational?style=flat-square) ![AppVersion: v2.2.0](https://img.shields.io/badge/AppVersion-v2.2.0-informational?style=flat-square)

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
| oci://registry-1.docker.io/bitnamicharts | common | 2.x.x |

## Values

| Key | Type | Default | Description |
|-----|------|---------|-------------|
| app.affinity | object | `{}` |  |
| app.args[0] | string | `"start"` |  |
| app.args[1] | string | `"--home"` |  |
| app.args[2] | string | `"$(CELESTIA_HOME)"` |  |
| app.automountServiceAccountToken | bool | `false` | mount service account token in app pods |
| app.command | list | `["celestia-appd"]` | command for the celestia-app |
| app.config.apptoml | object | `{"api":{"address":"tcp://0.0.0.0:1317","enable":false,"enabled_unsafe_cors":false,"max_open_connections":1000,"rpc_max_body_bytes":1000000,"rpc_read_timeout":10,"rpc_write_timeout":0,"swagger":false},"app_db_backend":"","grpc":{"address":"0.0.0.0:9090","enable":false,"max_recv_msg_size":"10485760","max_send_msg_size":"2147483647"},"grpc_web":{"address":"0.0.0.0:9091","enable":false,"enable_unsafe_cors":false},"halt_height":0,"halt_time":0,"iavl_cache_size":781250,"iavl_disable_fastnode":false,"iavl_lazy_loading":false,"index_events":[],"inter_block_cache":true,"min_retain_blocks":0,"minimum_gas_prices":"0.002utia","pruning":"default","pruning_interval":"0","pruning_keep_recent":"0","rosetta":{"address":":8080","blockchain":"app","denom_to_suggest":"uatom","enable":false,"enable_fee_suggestion":false,"gas_to_suggest":210000,"network":"network","offline":false,"retries":3},"state_sync":{"snapshot_interval":1500,"snapshot_keep_recent":2},"store":{"streamers":[]},"streamers":{"file":{"fsync":"false","keys":["*"],"output_metadata":"true","prefix":"","stop_node_on_error":"true","write_dir":""}},"telemetry":{"enable_hostname":false,"enable_hostname_label":false,"enable_service_label":false,"enabled":false,"global_labels":[],"prometheus_retention_time":0,"service_name":""}}` | configuration for the celestia-app app.toml |
| app.config.clienttoml | object | `{"broadcast_mode":"sync","chain_id":"celestia","keyring_backend":"test","node":"tcp://localhost:26657","output":"text"}` | configuration for the celestia-app client.toml |
| app.config.configtoml | object | `{"abci":"socket","consensus":{"create_empty_blocks":true,"create_empty_blocks_interval":"0s","double_sign_check_height":0,"only_internal_wal":"true","peer_gossip_sleep_duration":"100ms","peer_query_maj23_sleep_duration":"2s","skip_timeout_commit":false,"timeout_commit":"11s","timeout_precommit":"1s","timeout_precommit_delta":"500ms","timeout_prevote":"1s","timeout_prevote_delta":"500ms","timeout_propose":"10s","timeout_propose_delta":"500ms","wal_file":"data/cs.wal/wal"},"db_backend":"goleveldb","db_dir":"data","fast_sync":true,"fastsync":{"version":"v0"},"filter_peers":false,"genesis_file":"config/genesis.json","instrumentation":{"max_open_connections":3,"namespace":"cometbft","prometheus":false,"prometheus_listen_addr":":26660","pyroscope_profile_types":["cpu","alloc_objects","inuse_objects","goroutines","mutex_count","mutex_duration","block_count","block_duration"],"pyroscope_trace":false,"pyroscope_url":"","trace_pull_address":"","trace_push_batch_size":1000,"trace_push_config":"","trace_type":"noop","tracing_tables":"mempool_tx,mempool_peer_state,consensus_round_state,consensus_block_parts,consensus_block,consensus_vote"},"log_format":"plain","log_level":"info","mempool":{"broadcast":true,"cache_size":10000,"keep_invalid_txs_in_cache":false,"max_batch_bytes":0,"max_gossip_delay":"0s","max_tx_bytes":7897088,"max_txs_bytes":39485440,"recheck":true,"size":5000,"ttl_duration":"1m15s","ttl_num_blocks":5,"version":"v1","wal_dir":""},"moniker":"app","node_key_file":"config/node_key.json","p2p":{"addr_book_file":"config/addrbook.json","addr_book_strict":true,"allow_duplicate_ip":false,"dial_timeout":"3s","external_address":"","flush_throttle_timeout":"100ms","handshake_timeout":"20s","laddr":"tcp://0.0.0.0:26656","max_num_inbound_peers":40,"max_num_outbound_peers":10,"max_packet_msg_payload_size":1024,"persistent_peers":"","persistent_peers_max_dial_period":"0s","pex":true,"private_peer_ids":"","recv_rate":5120000,"seed_mode":false,"seeds":"","send_rate":5120000,"unconditional_peer_ids":"","upnp":false},"priv_validator_key_file":"config/priv_validator_key.json","priv_validator_laddr":"","priv_validator_state_file":"data/priv_validator_state.json","proxy_app":"tcp://127.0.0.1:26658","rpc":{"cors_allowed_headers":["Origin","Accept","Content-Type","X-Requested-With","X-Server-Time"],"cors_allowed_methods":["HEAD","GET","POST"],"cors_allowed_origins":[],"experimental_close_on_slow_client":false,"experimental_subscription_buffer_size":200,"experimental_websocket_write_buffer_size":200,"grpc_laddr":"","grpc_max_open_connections":900,"laddr":"tcp://127.0.0.1:26657","max_body_bytes":8388608,"max_header_bytes":1048576,"max_open_connections":900,"max_subscription_clients":100,"max_subscriptions_per_client":5,"pprof_laddr":"localhost:6060","timeout_broadcast_tx_commit":"50s","tls_cert_file":"","tls_key_file":"","unsafe":false},"statesync":{"chunk_fetchers":"4","chunk_request_timeout":"10s","discovery_time":"15s","enable":false,"rpc_servers":"","temp_dir":"","trust_hash":"","trust_height":0,"trust_period":"168h0m0s"},"storage":{"discard_abci_responses":true},"tx_index":{"indexer":"null","psql_conn":""}}` | configuration for the celestia-app config.toml |
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
| app.image | object | `{"digest":"","pullPolicy":"IfNotPresent","pullSecrets":[],"registry":"ghcr.io","repository":"celestiaorg/celestia-app","tag":"v2.2.0"}` | image parameters for the image |
| app.image.pullPolicy | string | `"IfNotPresent"` | pull policy for the image, IfNotPresent by default |
| app.image.registry | string | `"ghcr.io"` | registry for the image, GitHub Container Registry by default |
| app.image.repository | string | `"celestiaorg/celestia-app"` | repository for the image, celestiaorg/celestia-app by default |
| app.image.tag | string | `"v2.2.0"` | tag for the image, v2.2.0 by default |
| app.initContainers | list | `[]` |  |
| app.lifecycleHooks | object | `{}` |  |
| app.livenessProbe | object | `{"enabled":false,"failureThreshold":3,"initialDelaySeconds":0,"periodSeconds":10,"successThreshold":1,"timeoutSeconds":1}` | liveness probe for the app |
| app.livenessProbe.enabled | bool | `false` | enable liveness probe on app containers, false by default |
| app.livenessProbe.failureThreshold | int | `3` | failure threshold for livenessProbe, 3 by default |
| app.livenessProbe.initialDelaySeconds | int | `0` | initial delay seconds for livenessProbe, 0 by default |
| app.livenessProbe.periodSeconds | int | `10` | period seconds for livenessProbe, 10 by default |
| app.livenessProbe.successThreshold | int | `1` | success threshold for livenessProbe, 1 by default |
| app.livenessProbe.timeoutSeconds | int | `1` | timeout seconds for livenessProbe, 1 by default |
| app.nodeAffinityPreset.key | string | `""` |  |
| app.nodeAffinityPreset.type | string | `""` |  |
| app.nodeAffinityPreset.values | list | `[]` |  |
| app.nodeSelector | object | `{}` |  |
| app.otelAgent.config | object | `{"exporters":{"otlphttp":{"auth":{"authenticator":"basicauth/otlp"},"endpoint":"https://otlp-gateway-prod-us-central-0.grafana.net/otlp"},"prometheus":{"endpoint":"localhost:8889"}},"extensions":{"basicauth/otlp":{"client_auth":{"password":"${GRAFANA_OTEL_TOKEN}","username":"${GRAFANA_OTEL_USERNAME}"}}},"receivers":{"otlp":{"protocols":{"grpc":{"endpoint":"localhost:4317"},"http":{"endpoint":"localhost:4318"}}},"prometheus":{"config":{"scrape_configs":[{"job_name":"${JOB_NAME}","scrape_interval":"10s","static_configs":[{"targets":["localhost:26660"]}]}]}}},"service":{"extensions":["basicauth/otlp"],"pipelines":{"metrics":{"exporters":["otlphttp","prometheus"],"receivers":["otlp","prometheus"]}},"telemetry":{"logs":{"level":"INFO"},"metrics":{"address":"localhost:8888","level":"basic"}}}}` | config for the otel agent (See: https://opentelemetry.io/docs/collector/configuration/) |
| app.otelAgent.enabled | bool | `false` | enable otel agent for the app, false by default |
| app.otelAgent.grafanaOtelSecret | object | `{"name":"SET_IT"}` | grafana otel secret for the app |
| app.otelAgent.grafanaOtelSecret.name | string | `"SET_IT"` | name of the grafana otel secret, it must be set |
| app.otelAgent.image | object | `{"digest":"","pullPolicy":"IfNotPresent","registry":"ghcr.io","repository":"open-telemetry/opentelemetry-collector-releases/opentelemetry-collector-contrib","tag":"0.102.0"}` | image for the otel agent, ghcr.io/open-telemetry/opentelemetry-collector-releases/opentelemetry-collector-contrib:0.102.0 by default |
| app.otelAgent.resources | object | `{}` |  |
| app.otelAgent.resourcesPreset | string | `"micro"` |  |
| app.pdb.create | bool | `false` |  |
| app.pdb.maxUnavailable | string | `""` |  |
| app.pdb.minAvailable | int | `1` |  |
| app.persistentVolumeClaimRetentionPolicy.whenDeleted | string | `"Retain"` |  |
| app.persistentVolumeClaimRetentionPolicy.whenScaled | string | `"Retain"` |  |
| app.podAffinityPreset | string | `""` |  |
| app.podAnnotations | object | `{}` |  |
| app.podAntiAffinityPreset | string | `"soft"` |  |
| app.podLabels | object | `{}` |  |
| app.podManagementPolicy | string | `"OrderedReady"` |  |
| app.podSecurityContext | object | `{"enabled":true,"fsGroup":10001,"fsGroupChangePolicy":"Always","supplementalGroups":[],"sysctls":[]}` | pod security context for the app |
| app.podSecurityContext.enabled | bool | `true` | enable pod security context for the app, true by default |
| app.podSecurityContext.fsGroup | int | `10001` | fsGroup in app pods' Security Context, 10001 by default |
| app.podSecurityContext.fsGroupChangePolicy | string | `"Always"` | filesystem group change policy for app pods, Always by default |
| app.podSecurityContext.supplementalGroups | list | `[]` | filesystem extra groups for app pods, [] by default |
| app.podSecurityContext.sysctls | list | `[]` | kernel settings using the sysctl interface for app pods, [] by default |
| app.priorityClassName | string | `""` |  |
| app.readinessProbe.enabled | bool | `false` | enable readiness probe on app containers, false by default |
| app.readinessProbe.failureThreshold | int | `3` | failure threshold for readinessProbe, 3 by default |
| app.readinessProbe.initialDelaySeconds | int | `0` | initial delay seconds for readinessProbe, 0 by default |
| app.readinessProbe.periodSeconds | int | `10` | period seconds for readinessProbe, 10 by default |
| app.readinessProbe.successThreshold | int | `1` | success threshold for readinessProbe, 1 by default |
| app.readinessProbe.timeoutSeconds | int | `1` | timeout seconds for readinessProbe, 1 by default |
| app.replicaCount | int | `1` | number of app replicas to deploy, 1 by default |
| app.resources | object | `{"limits":{"cpu":2,"memory":"8Gi"},"requests":{"cpu":2,"memory":"8Gi"}}` | resources for the app |
| app.resources.limits | object | `{"cpu":2,"memory":"8Gi"}` | limits for the app |
| app.resources.limits.cpu | int | `2` | cpu limits for the app, 2 by default |
| app.resources.limits.memory | string | `"8Gi"` | memory limits for the app, 8Gi by default |
| app.resources.requests | object | `{"cpu":2,"memory":"8Gi"}` | requests for the app |
| app.resources.requests.cpu | int | `2` | cpu requests for the app, 2 by default |
| app.resources.requests.memory | string | `"8Gi"` | memory requests for the app, 8Gi by default |
| app.resourcesPreset | string | `"nano"` | more information: https://github.com/bitnami/charts/blob/main/bitnami/common/templates/_resources.tpl#L15 |
| app.schedulerName | string | `""` |  |
| app.settings.generateNewKeys | bool | `true` |  |
| app.settings.genesisURL | string | `""` | genesis URL for the celestia-app, it must be set |
| app.settings.home | string | `"/home/celestia"` | home directory for the celestia-app, defaults to /home/celestia |
| app.settings.network | string | `"celestia"` |  |
| app.settings.secret.name | string | `""` | name of the secret, it must be set |
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
| metrics.enabled | bool | `false` |  |
| metrics.serviceMonitor.annotations | object | `{}` |  |
| metrics.serviceMonitor.enabled | bool | `false` |  |
| metrics.serviceMonitor.honorLabels | bool | `false` |  |
| metrics.serviceMonitor.interval | string | `""` |  |
| metrics.serviceMonitor.jobLabel | string | `""` |  |
| metrics.serviceMonitor.labels | object | `{}` |  |
| metrics.serviceMonitor.metricRelabelings | list | `[]` |  |
| metrics.serviceMonitor.namespace | string | `""` |  |
| metrics.serviceMonitor.relabelings | list | `[]` |  |
| metrics.serviceMonitor.scrapeTimeout | string | `""` |  |
| metrics.serviceMonitor.selector | object | `{}` |  |
| nameOverride | string | `""` |  |
| namespaceOverride | string | `""` |  |
| networkPolicy | with the correct destination port | `{"allowExternal":true,"allowExternalEgress":true,"enabled":true,"extraEgress":[],"extraIngress":[],"ingressNSMatchLabels":{},"ingressNSPodMatchLabels":{}}` | . |
| networkPolicy.enabled | bool | `true` | enable network policy, true by default |
| persistence | object | `{"accessModes":["ReadWriteOnce"],"annotations":{},"dataSource":{},"enabled":true,"existingClaim":"","mountPath":"/bitnami/app/data","selector":{},"size":"250Gi","storageClass":"","subPath":""}` | persistence parameters |
| persistence.enabled | bool | `true` | enable persistence, true by default |
| persistence.size | string | `"250Gi"` | size of data volume, 250Gi by default |
| rbac.create | bool | `false` |  |
| rbac.rules | list | `[]` |  |
| service | object | `{"external":{"annotations":{},"enabled":true,"externalTrafficPolicy":"Cluster","extraPorts":[],"loadBalancerIP":"","loadBalancerSourceRanges":[],"nodePorts":{"api":"","grpc":"","p2p":"","prometheus":"","rpc":"","tracing":""},"ports":{"api":1317,"grpc":9090,"p2p":26656,"rpc":26657},"sessionAffinity":"None","sessionAffinityConfig":{},"type":"LoadBalancer"},"internal":{"annotations":{},"clusterIP":"","ports":{"api":1317,"grpc":9090,"p2p":26656,"prometheus":26660,"rpc":26657,"tracing":26661},"sessionAffinity":"None","sessionAffinityConfig":{},"type":"ClusterIP"}}` | service parameters |
| service.external | object | `{"annotations":{},"enabled":true,"externalTrafficPolicy":"Cluster","extraPorts":[],"loadBalancerIP":"","loadBalancerSourceRanges":[],"nodePorts":{"api":"","grpc":"","p2p":"","prometheus":"","rpc":"","tracing":""},"ports":{"api":1317,"grpc":9090,"p2p":26656,"rpc":26657},"sessionAffinity":"None","sessionAffinityConfig":{},"type":"LoadBalancer"}` | external service parameters |
| service.external.enabled | bool | `true` | enable external service, true by default |
| service.external.nodePorts | object | `{"api":"","grpc":"","p2p":"","prometheus":"","rpc":"","tracing":""}` | node ports for the celestia-app |
| service.external.nodePorts.api | string | `""` | api port, 1317 by default |
| service.external.nodePorts.grpc | string | `""` | grpc port, 9090 by default |
| service.external.nodePorts.p2p | string | `""` | p2p port, 26656 by default |
| service.external.nodePorts.prometheus | string | `""` | prometheus port, 26660 by default |
| service.external.nodePorts.rpc | string | `""` | rpc port, 26657 by default |
| service.external.nodePorts.tracing | string | `""` | tracing port, 26661 by default |
| service.external.ports.api | int | `1317` | api port, 1317 by default |
| service.external.ports.grpc | int | `9090` | grpc port, 9090 by default |
| service.external.ports.p2p | int | `26656` | p2p port, 26656 by default |
| service.external.ports.rpc | int | `26657` | rpc port, 26657 by default |
| service.external.type | string | `"LoadBalancer"` | external service type, LoadBalancer by default |
| service.internal | object | `{"annotations":{},"clusterIP":"","ports":{"api":1317,"grpc":9090,"p2p":26656,"prometheus":26660,"rpc":26657,"tracing":26661},"sessionAffinity":"None","sessionAffinityConfig":{},"type":"ClusterIP"}` | service type, ClusterIP by default |
| service.internal.ports | object | `{"api":1317,"grpc":9090,"p2p":26656,"prometheus":26660,"rpc":26657,"tracing":26661}` | ports for the celestia-app |
| service.internal.ports.api | int | `1317` | api port, 1317 by default |
| service.internal.ports.grpc | int | `9090` | grpc port, 9090 by default |
| service.internal.ports.p2p | int | `26656` | p2p port, 26656 by default |
| service.internal.ports.prometheus | int | `26660` | prometheus port, 26660 by default |
| service.internal.ports.rpc | int | `26657` | rpc port, 26657 by default |
| service.internal.ports.tracing | int | `26661` | tracing port, 26661 by default |
| serviceAccount.annotations | object | `{}` |  |
| serviceAccount.automountServiceAccountToken | bool | `true` |  |
| serviceAccount.create | bool | `true` |  |
| serviceAccount.name | string | `""` |  |
| volumePermissions.containerSecurityContext.enabled | bool | `true` |  |
| volumePermissions.containerSecurityContext.runAsUser | int | `0` |  |
| volumePermissions.containerSecurityContext.seLinuxOptions | object | `{}` |  |
| volumePermissions.enabled | bool | `false` |  |
| volumePermissions.image.pullPolicy | string | `"IfNotPresent"` |  |
| volumePermissions.image.pullSecrets | list | `[]` |  |
| volumePermissions.image.registry | string | `"docker.io"` |  |
| volumePermissions.image.repository | string | `"bitnami/os-shell"` |  |
| volumePermissions.image.tag | string | `"12-debian-12-r22"` |  |
| volumePermissions.resources | object | `{}` |  |
| volumePermissions.resourcesPreset | string | `"nano"` |  |

----------------------------------------------
Autogenerated from chart metadata using [helm-docs v1.14.2](https://github.com/norwoodj/helm-docs/releases/v1.14.2)
