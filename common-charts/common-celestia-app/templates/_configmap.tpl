{{- define "common-celestia-app.configmap" -}}
apiVersion: v1
kind: ConfigMap
metadata:
  name: {{ include "common.names.fullname" . }}-config
  namespace: {{ include "common.names.namespace" . | quote }}
  labels: {{- include "common.labels.standard" ( dict "customLabels" .Values.commonLabels "context" $ ) | nindent 4 }}
    app.kubernetes.io/component: app
  {{- if .Values.commonAnnotations }}
  annotations: {{- include "common.tplvalues.render" ( dict "value" .Values.commonAnnotations "context" $ ) | nindent 4 }}
  {{- end }}
data:
  app.toml: |
    {{ include "common-celestia-app.app_config.toml" . | nindent 4 }}
  client.toml: |
    {{ include "common-celestia-app.client_config.toml" . | nindent 4 }}
  config.toml: |
    {{ include "common-celestia-app.config_config.toml" . | nindent 4 }}
{{- end }}
