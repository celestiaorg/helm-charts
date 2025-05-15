{{- define "common-celestia-app.app_config.toml" -}}
minimum-gas-prices = "{{ .Values.app.config.app.minimum_gas_prices }}"
query-gas-limit = "{{ .Values.app.config.app.query_gas_limit }}"
pruning = "{{ .Values.app.config.app.pruning }}"
pruning-keep-recent = "{{ .Values.app.config.app.pruning_keep_recent }}"
pruning-interval = "{{ .Values.app.config.app.pruning_interval }}"
halt-height = {{ printf "%.0f" .Values.app.config.app.halt_height }}
halt-time = {{ printf "%.0f" .Values.app.config.app.halt_time }}
min-retain-blocks = {{ printf "%.0f" .Values.app.config.app.min_retain_blocks }}
inter-block-cache = {{ .Values.app.config.app.inter_block_cache }}
index-events = {{ .Values.app.config.app.index_events }}
iavl-cache-size = {{ printf "%.0f" .Values.app.config.app.iavl_cache_size }}
iavl-disable-fastnode = {{ .Values.app.config.app.iavl_disable_fastnode }}
app-db-backend = "{{ .Values.app.config.app.app_db_backend }}"
[telemetry]
service-name = "{{ .Values.app.config.app.telemetry.service_name }}"
enabled = {{ .Values.app.config.app.telemetry.enabled }}
enable-hostname = {{ .Values.app.config.app.telemetry.enable_hostname }}
enable-hostname-label = {{ .Values.app.config.app.telemetry.enable_hostname_label }}
enable-service-label = {{ .Values.app.config.app.telemetry.enable_service_label }}
prometheus-retention-time = {{ printf "%.0f" .Values.app.config.app.telemetry.prometheus_retention_time }}
global-labels = {{ .Values.app.config.app.telemetry.global_labels }}
metrics-sink = "{{ .Values.app.config.app.telemetry.metrics_sink }}"
statsd-addr = "{{ .Values.app.config.app.telemetry.statsd_addr }}"
datadog-hostname = "{{ .Values.app.config.app.telemetry.datadog_hostname }}"
[api]
enable = {{ .Values.app.config.app.api.enable }}
swagger = {{ .Values.app.config.app.api.swagger }}
address = "{{ .Values.app.config.app.api.address }}"
max-open-connections = {{ printf "%.0f" .Values.app.config.app.api.max_open_connections }}
rpc-read-timeout = {{ printf "%.0f" .Values.app.config.app.api.rpc_read_timeout }}
rpc-write-timeout = {{ printf "%.0f" .Values.app.config.app.api.rpc_write_timeout }}
rpc-max-body-bytes = {{ printf "%.0f" .Values.app.config.app.api.rpc_max_body_bytes }}
enabled-unsafe-cors = {{ .Values.app.config.app.api.enabled_unsafe_cors }}
[grpc]
enable = {{ .Values.app.config.app.grpc.enable }}
address = "{{ .Values.app.config.app.grpc.address }}"
max-recv-msg-size = "{{ .Values.app.config.app.grpc.max_recv_msg_size }}"
max-send-msg-size = "{{ .Values.app.config.app.grpc.max_send_msg_size }}"
[grpc_web]
enable = {{ .Values.app.config.app.grpc_web.enable }}
[state_sync]
snapshot-interval = {{ printf "%.0f" .Values.app.config.app.state_sync.snapshot_interval }}
snapshot-keep-recent = {{ printf "%.0f" .Values.app.config.app.state_sync.snapshot_keep_recent }}
[streaming]
[streaming.abci]
keys = {{ .Values.app.config.app.streaming.abci.keys }}
plugin = "{{ .Values.app.config.app.streaming.abci.plugin }}"
stop-node-on-err = {{ .Values.app.config.app.streaming.abci.stop_node_on_err }}
[mempool]
max-txs = {{ .Values.app.config.app.mempool.max_txs }}
{{- end }}
