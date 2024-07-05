{{/*
Return the proper app image name
*/}}
{{- define "node.image" -}}
{{ include "common.images.image" (dict "imageRoot" .Values.node.image "global" .Values.global) }}
{{- end -}}

{{/*
Return the proper image name (for the init container volume-permissions image)
*/}}
{{- define "node.volumePermissions.image" -}}
{{- include "common.images.image" ( dict "imageRoot" .Values.volumePermissions.image "global" .Values.global ) -}}
{{- end -}}

{{/*
Return the proper Docker Image Registry Secret Names
*/}}
{{- define "node.imagePullSecrets" -}}
{{- include "common.images.renderPullSecrets" (dict "images" (list .Values.node.image .Values.volumePermissions.image) "context" $) -}}
{{- end -}}

{{/*
Create the name of the service account to use
*/}}
{{- define "node.serviceAccountName" -}}
{{- if .Values.serviceAccount.create -}}
    {{ default (include "common.names.fullname" .) .Values.serviceAccount.name }}
{{- else -}}
    {{ default "default" .Values.serviceAccount.name }}
{{- end -}}
{{- end -}}

{{/*
Return the proper image name for the otel agent
*/}}
{{- define "node.otelAgent.image" -}}
{{- include "common.images.image" (dict "imageRoot" .Values.node.otelAgent.image "global" .Values.global) -}}
{{- end -}}

{{/*
Validate the node.settings.nodeType value against the first argument in node.args.
*/}}
{{- define "node.validateValues.nodeType" -}}
{{- if not (hasKey .Values.node.settings "nodeType") -}}
Node type is not set. Must be one of 'bridge', 'full', or 'light'.
{{- else if and (ne .Values.node.settings.nodeType "bridge") (ne .Values.node.settings.nodeType "full") (ne .Values.node.settings.nodeType "light") -}}
Invalid node type: {{ .Values.node.settings.nodeType }}. Must be one of 'bridge', 'full', or 'light'.
{{- else if not (hasKey .Values.node "args") -}}
Node args are not set.
{{- else if not (eq .Values.node.settings.nodeType (first .Values.node.args)) -}}
The nodeType value ({{ .Values.node.settings.nodeType }}) does not match the first argument in args ({{ first .Values.node.args }}).
{{- end -}}
{{- end -}}

# TODO: add validations for values
# Remember to add the validation message to NOTES.txt at the end ({{- include "node.validateValues" . }})
{{/*
Compile all warnings into a single message and fail the deployment if there are any.
*/}}
{{- define "node.validateValues" -}}
{{- $messages := list -}}
{{- $messages := append $messages (include "node.validateValues.nodeType" .) -}}
{{- $messages := without $messages "" -}}
{{- $message := join "\n" $messages -}}

{{- if $message -}}
{{- fail (printf "\nVALUES VALIDATION:\n%s" $message) -}}
{{- end -}}
{{- end -}}
