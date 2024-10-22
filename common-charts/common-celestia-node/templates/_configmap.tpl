{{- define "common-celestia-node.configmap" -}}
apiVersion: v1
kind: ConfigMap
metadata:
  name: {{ include "common.names.fullname" . }}-configtoml
  namespace: {{ include "common.names.namespace" . | quote }}
  labels:
    {{- include "common.labels.standard" ( dict "customLabels" .Values.commonLabels "context" $ ) | nindent 4 }}
    app.kubernetes.io/component: node
  {{- if .Values.commonAnnotations }}
  annotations:
    {{- include "common.tplvalues.render" ( dict "value" .Values.commonAnnotations "context" $ ) | nindent 4 }}
  {{- end }}
data:
  config.toml: |
    {{- if eq .Values.node.settings.nodeType "bridge" -}}
      {{ include "common-celestia-node.bridge_config.toml" . | nindent 4 }}
    {{- else if eq .Values.node.settings.nodeType "full" -}}
      {{ include "common-celestia-node.full_config.toml" . | nindent 4 }}
    {{- else if eq .Values.node.settings.nodeType "light" -}}
      {{ include "common-celestia-node.light_config.toml" . | nindent 4 }}
    {{- else -}}
      {{ fail "Unsupported nodeType value, must be one of: bridge, full, or light" }}
    {{- end }}
{{- end }}