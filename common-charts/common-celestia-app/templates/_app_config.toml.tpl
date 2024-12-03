{{- define "common-celestia-app.app_config.toml" -}}
minimum-gas-prices = "{{ .Values.app.config.apptoml.minimum_gas_prices }}"
pruning = "{{ .Values.app.config.apptoml.pruning }}"
pruning-keep-recent = "{{ .Values.app.config.apptoml.pruning_keep_recent }}"
pruning-interval = "{{ .Values.app.config.apptoml.pruning_interval }}"
halt-height = {{ .Values.app.config.apptoml.halt_height }}
halt-time = {{ .Values.app.config.apptoml.halt_time }}
min-retain-blocks = {{ .Values.app.config.apptoml.min_retain_blocks }}
inter-block-cache = {{ .Values.app.config.apptoml.inter_block_cache }}
index-events = {{ .Values.app.config.apptoml.index_events }}
iavl-cache-size = {{ .Values.app.config.apptoml.iavl_cache_size }}
iavl-disable-fastnode = {{ .Values.app.config.apptoml.iavl_disable_fastnode }}
iavl-lazy-loading = {{ .Values.app.config.apptoml.iavl_lazy_loading }}
app-db-backend = "{{ .Values.app.config.apptoml.app_db_backend }}"
[telemetry]
service-name = "{{ .Values.app.config.apptoml.telemetry.service_name }}"
enabled = {{ .Values.app.config.apptoml.telemetry.enabled }}
enable-hostname = {{ .Values.app.config.apptoml.telemetry.enable_hostname }}
enable-hostname-label = {{ .Values.app.config.apptoml.telemetry.enable_hostname_label }}
enable-service-label = {{ .Values.app.config.apptoml.telemetry.enable_service_label }}
prometheus-retention-time = {{ .Values.app.config.apptoml.telemetry.prometheus_retention_time }}
global-labels = {{ .Values.app.config.apptoml.telemetry.global_labels }}
[api]
enable = {{ .Values.app.config.apptoml.api.enable }}
swagger = {{ .Values.app.config.apptoml.api.swagger }}
address = "{{ .Values.app.config.apptoml.api.address }}"
max-open-connections = {{ .Values.app.config.apptoml.api.max_open_connections }}
rpc-read-timeout = {{ .Values.app.config.apptoml.api.rpc_read_timeout }}
rpc-write-timeout = {{ .Values.app.config.apptoml.api.rpc_write_timeout }}
rpc-max-body-bytes = {{ printf "%.0f" .Values.app.config.apptoml.api.rpc_max_body_bytes }}
enabled-unsafe-cors = {{ .Values.app.config.apptoml.api.enabled_unsafe_cors }}
[rosetta]
enable = {{ .Values.app.config.apptoml.rosetta.enable }}
address = "{{ .Values.app.config.apptoml.rosetta.address }}"
blockchain = "{{ .Values.app.config.apptoml.rosetta.blockchain }}"
network = "{{ .Values.app.config.apptoml.rosetta.network }}"
retries = {{ .Values.app.config.apptoml.rosetta.retries }}
offline = {{ .Values.app.config.apptoml.rosetta.offline }}
enable-fee-suggestion = {{ .Values.app.config.apptoml.rosetta.enable_fee_suggestion }}
gas-to-suggest = {{ .Values.app.config.apptoml.rosetta.gas_to_suggest }}
denom-to-suggest = "{{ .Values.app.config.apptoml.rosetta.denom_to_suggest }}"
[grpc]
enable = {{ .Values.app.config.apptoml.grpc.enable }}
address = "{{ .Values.app.config.apptoml.grpc.address }}"
max-recv-msg-size = "{{ .Values.app.config.apptoml.grpc.max_recv_msg_size }}"
max-send-msg-size = "{{ .Values.app.config.apptoml.grpc.max_send_msg_size }}"
[grpc_web]
enable = {{ .Values.app.config.apptoml.grpc_web.enable }}
address = "{{ .Values.app.config.apptoml.grpc_web.address }}"
enable-unsafe-cors = {{ .Values.app.config.apptoml.grpc_web.enable_unsafe_cors }}
[state_sync]
snapshot-interval = {{ .Values.app.config.apptoml.state_sync.snapshot_interval }}
snapshot-keep-recent = {{ .Values.app.config.apptoml.state_sync.snapshot_keep_recent }}
[store]
streamers = []
[streamers.file]
keys = ["*"]
write_dir = "{{ .Values.app.config.apptoml.streamers.file.write_dir }}"
prefix = "{{ .Values.app.config.apptoml.streamers.file.prefix }}"
output-metadata = {{ .Values.app.config.apptoml.streamers.file.output_metadata }}
stop-node-on-error = {{ .Values.app.config.apptoml.streamers.file.stop_node_on_error }}
fsync = {{ .Values.app.config.apptoml.streamers.file.fsync }}
{{- end }}
