{{- define "common-celestia-app.client_config.toml" -}}
chain-id = "{{ .Values.app.config.client.chain_id }}"
keyring-backend = "{{ .Values.app.config.client.keyring_backend }}"
output = "{{ .Values.app.config.client.output }}"
node = "{{ .Values.app.config.client.node }}"
broadcast-mode = "{{ .Values.app.config.client.broadcast_mode }}"
{{- end }}
