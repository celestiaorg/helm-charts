{{- define "common-celestia-app.config_config.toml" -}}
proxy_app = "{{ .Values.app.config.config.proxy_app }}"
moniker = "{{ .Values.app.config.config.moniker }}"
fast_sync = {{ .Values.app.config.config.fast_sync }}
db_backend = "{{ .Values.app.config.config.db_backend }}"
db_dir = "{{ .Values.app.config.config.db_dir }}"
log_level = "{{ .Values.app.config.config.log_level }}"
log_format = "{{ .Values.app.config.config.log_format }}"
genesis_file = "{{ .Values.app.config.config.genesis_file }}"
priv_validator_key_file = "{{ .Values.app.config.config.priv_validator_key_file }}"
priv_validator_state_file = "{{ .Values.app.config.config.priv_validator_state_file }}"
priv_validator_laddr = "{{ .Values.app.config.config.priv_validator_laddr }}"
node_key_file = "{{ .Values.app.config.config.node_key_file }}"
abci = "{{ .Values.app.config.config.abci }}"
filter_peers = {{ .Values.app.config.config.filter_peers }}
[rpc]
laddr = "{{ .Values.app.config.config.rpc.laddr }}"
cors_allowed_origins = {{ .Values.app.config.config.rpc.cors_allowed_origins }}
cors_allowed_methods = [{{ range $index, $element := .Values.app.config.config.rpc.cors_allowed_methods }}{{ if $index }}, {{ end }}"{{ $element }}"{{ end }}]
cors_allowed_headers = [{{ range $index, $element := .Values.app.config.config.rpc.cors_allowed_headers }}{{ if $index }}, {{ end }}"{{ $element }}"{{ end }}]
grpc_laddr = "{{ .Values.app.config.config.rpc.grpc_laddr }}"
grpc_max_open_connections = {{ printf "%.0f" .Values.app.config.config.rpc.grpc_max_open_connections }}
unsafe = {{ .Values.app.config.config.rpc.unsafe }}
max_open_connections = {{ printf "%.0f" .Values.app.config.config.rpc.max_open_connections }}
max_subscription_clients = {{ printf "%.0f" .Values.app.config.config.rpc.max_subscription_clients }}
max_subscriptions_per_client = {{ printf "%.0f" .Values.app.config.config.rpc.max_subscriptions_per_client }}
experimental_subscription_buffer_size = {{ printf "%.0f" .Values.app.config.config.rpc.experimental_subscription_buffer_size }}
experimental_websocket_write_buffer_size = {{ printf "%.0f" .Values.app.config.config.rpc.experimental_websocket_write_buffer_size }}
experimental_close_on_slow_client = {{ .Values.app.config.config.rpc.experimental_close_on_slow_client }}
timeout_broadcast_tx_commit = "{{ .Values.app.config.config.rpc.timeout_broadcast_tx_commit }}"
max_body_bytes = {{ printf "%.0f" .Values.app.config.config.rpc.max_body_bytes }}
max_header_bytes = {{ printf "%.0f" .Values.app.config.config.rpc.max_header_bytes }}
tls_cert_file = "{{ .Values.app.config.config.rpc.tls_cert_file }}"
tls_key_file = "{{ .Values.app.config.config.rpc.tls_key_file }}"
pprof_laddr = "{{ .Values.app.config.config.rpc.pprof_laddr }}"
[p2p]
laddr = "{{ .Values.app.config.config.p2p.laddr }}"
external_address = "{{ .Values.app.config.config.p2p.external_address }}"
seeds = "{{ .Values.app.config.config.p2p.seeds }}"
persistent_peers = "{{ .Values.app.config.config.p2p.persistent_peers }}"
upnp = {{ .Values.app.config.config.p2p.upnp }}
addr_book_file = "{{ .Values.app.config.config.p2p.addr_book_file }}"
addr_book_strict = {{ .Values.app.config.config.p2p.addr_book_strict }}
max_num_inbound_peers = {{ printf "%.0f" .Values.app.config.config.p2p.max_num_inbound_peers }}
max_num_outbound_peers = {{ printf "%.0f" .Values.app.config.config.p2p.max_num_outbound_peers }}
unconditional_peer_ids = "{{ .Values.app.config.config.p2p.unconditional_peer_ids }}"
persistent_peers_max_dial_period = "{{ .Values.app.config.config.p2p.persistent_peers_max_dial_period }}"
flush_throttle_timeout = "{{ .Values.app.config.config.p2p.flush_throttle_timeout }}"
max_packet_msg_payload_size = {{ printf "%.0f" .Values.app.config.config.p2p.max_packet_msg_payload_size }}
send_rate = {{ printf "%.0f" .Values.app.config.config.p2p.send_rate }}
recv_rate = {{ printf "%.0f" .Values.app.config.config.p2p.recv_rate }}
pex = {{ .Values.app.config.config.p2p.pex }}
seed_mode = {{ .Values.app.config.config.p2p.seed_mode }}
private_peer_ids = "{{ .Values.app.config.config.p2p.private_peer_ids }}"
allow_duplicate_ip = {{ .Values.app.config.config.p2p.allow_duplicate_ip }}
handshake_timeout = "{{ .Values.app.config.config.p2p.handshake_timeout }}"
dial_timeout = "{{ .Values.app.config.config.p2p.dial_timeout }}"
[mempool]
version = "{{ .Values.app.config.config.mempool.version }}"
recheck = {{ .Values.app.config.config.mempool.recheck }}
broadcast = {{ .Values.app.config.config.mempool.broadcast }}
wal_dir = "{{ .Values.app.config.config.mempool.wal_dir }}"
size = {{ printf "%.0f" .Values.app.config.config.mempool.size }}
max_txs_bytes = {{ printf "%.0f" .Values.app.config.config.mempool.max_txs_bytes }}
cache_size = {{ printf "%.0f" .Values.app.config.config.mempool.cache_size }}
keep-invalid-txs-in-cache = {{ .Values.app.config.config.mempool.keep_invalid_txs_in_cache }}
max_tx_bytes = {{ printf "%.0f" .Values.app.config.config.mempool.max_tx_bytes }}
max_batch_bytes = {{ printf "%.0f" .Values.app.config.config.mempool.max_batch_bytes }}
ttl-duration = "{{ .Values.app.config.config.mempool.ttl_duration }}"
ttl-num-blocks = {{ printf "%.0f" .Values.app.config.config.mempool.ttl_num_blocks }}
max-gossip-delay = "{{ .Values.app.config.config.mempool.max_gossip_delay }}"
experimental_max_gossip_connections_to_persistent_peers = {{ printf "%.0f" .Values.app.config.config.mempool.experimental_max_gossip_connections_to_persistent_peers }}
experimental_max_gossip_connections_to_non_persistent_peers = {{ printf "%.0f" .Values.app.config.config.mempool.experimental_max_gossip_connections_to_non_persistent_peers }}
[statesync]
enable = {{ .Values.app.config.config.statesync.enable }}
rpc_servers = "{{ .Values.app.config.config.statesync.rpc_servers }}"
trust_height = {{ printf "%.0f" .Values.app.config.config.statesync.trust_height }}
trust_hash = "{{ .Values.app.config.config.statesync.trust_hash }}"
trust_period = "{{ .Values.app.config.config.statesync.trust_period }}"
discovery_time = "{{ .Values.app.config.config.statesync.discovery_time }}"
temp_dir = "{{ .Values.app.config.config.statesync.temp_dir }}"
chunk_request_timeout = "{{ .Values.app.config.config.statesync.chunk_request_timeout }}"
chunk_fetchers = "{{ .Values.app.config.config.statesync.chunk_fetchers }}"
[fastsync]
version = "{{ .Values.app.config.config.fastsync.version }}"
[consensus]
only_internal_wal = "{{ .Values.app.config.config.consensus.only_internal_wal }}"
wal_file = "{{ .Values.app.config.config.consensus.wal_file }}"
timeout_propose = "{{ .Values.app.config.config.consensus.timeout_propose }}"
timeout_propose_delta = "{{ .Values.app.config.config.consensus.timeout_propose_delta }}"
timeout_prevote = "{{ .Values.app.config.config.consensus.timeout_prevote }}"
timeout_prevote_delta = "{{ .Values.app.config.config.consensus.timeout_prevote_delta }}"
timeout_precommit = "{{ .Values.app.config.config.consensus.timeout_precommit }}"
timeout_precommit_delta = "{{ .Values.app.config.config.consensus.timeout_precommit_delta }}"
timeout_commit = "{{ .Values.app.config.config.consensus.timeout_commit }}"
double_sign_check_height = {{ printf "%.0f" .Values.app.config.config.consensus.double_sign_check_height }}
skip_timeout_commit = {{ .Values.app.config.config.consensus.skip_timeout_commit }}
create_empty_blocks = {{ .Values.app.config.config.consensus.create_empty_blocks }}
create_empty_blocks_interval = "{{ .Values.app.config.config.consensus.create_empty_blocks_interval }}"
peer_gossip_sleep_duration = "{{ .Values.app.config.config.consensus.peer_gossip_sleep_duration }}"
peer_query_maj23_sleep_duration = "{{ .Values.app.config.config.consensus.peer_query_maj23_sleep_duration }}"
[storage]
discard_abci_responses = {{ .Values.app.config.config.storage.discard_abci_responses }}
[tx_index]
indexer = "{{ .Values.app.config.config.tx_index.indexer }}"
psql-conn = "{{ .Values.app.config.config.tx_index.psql_conn }}"
[instrumentation]
prometheus = {{ .Values.app.config.config.instrumentation.prometheus }}
prometheus_listen_addr = "{{ .Values.app.config.config.instrumentation.prometheus_listen_addr }}"
max_open_connections = {{ printf "%.0f" .Values.app.config.config.instrumentation.max_open_connections }}
namespace = "{{ .Values.app.config.config.instrumentation.namespace }}"
trace_push_config = "{{ .Values.app.config.config.instrumentation.trace_push_config }}"
trace_pull_address = "{{ .Values.app.config.config.instrumentation.trace_pull_address }}"
trace_type = "{{ .Values.app.config.config.instrumentation.trace_type }}"
trace_push_batch_size = {{ printf "%.0f" .Values.app.config.config.instrumentation.trace_push_batch_size }}
tracing_tables = "{{ .Values.app.config.config.instrumentation.tracing_tables }}"
pyroscope_url = "{{ .Values.app.config.config.instrumentation.pyroscope_url }}"
pyroscope_trace = {{ .Values.app.config.config.instrumentation.pyroscope_trace }}
pyroscope_profile_types = [{{ range $index, $element := .Values.app.config.config.instrumentation.pyroscope_profile_types }}{{ if $index }}, {{ end }}"{{ $element }}"{{ end }}]
{{- end }}
