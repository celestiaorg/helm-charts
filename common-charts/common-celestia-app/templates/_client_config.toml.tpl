{{- define "common-celestia-app.client_config.toml" -}}
chain-id = "{{ .Values.app.config.clienttoml.chain_id }}"
keyring-backend = "{{ .Values.app.config.clienttoml.keyring_backend }}"
output = "{{ .Values.app.config.clienttoml.output }}"
node = "{{ .Values.app.config.clienttoml.node }}"
broadcast-mode = "{{ .Values.app.config.clienttoml.broadcast_mode }}"
{{- end }}
