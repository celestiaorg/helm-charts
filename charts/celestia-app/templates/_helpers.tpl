{{/*
Return the proper app image name
*/}}
{{- define "app.image" -}}
{{ include "common.images.image" (dict "imageRoot" .Values.app.image "global" .Values.global) }}
{{- end -}}

{{/*
Return the proper image name (for the init container volume-permissions image)
*/}}
{{- define "app.volumePermissions.image" -}}
{{- include "common.images.image" ( dict "imageRoot" .Values.app.volumePermissions.image "global" .Values.global ) -}}
{{- end -}}

{{/*
Return the proper Docker Image Registry Secret Names
*/}}
{{- define "app.imagePullSecrets" -}}
{{- $pullSecrets := list }}

{{- if .Values.global.imagePullSecrets -}}
    {{- range .Values.global.imagePullSecrets -}}
        {{- $pullSecrets = append $pullSecrets . -}}
    {{- end -}}
{{- end -}}

{{- if .Values.app.image.pullSecrets -}}
    {{- range .Values.app.image.pullSecrets -}}
        {{- $pullSecrets = append $pullSecrets . -}}
    {{- end -}}
{{- end -}}

{{- if .Values.app.volumePermissions.image.pullSecrets -}}
    {{- range .Values.app.volumePermissions.image.pullSecrets -}}
        {{- $pullSecrets = append $pullSecrets . -}}
    {{- end -}}
{{- end -}}

{{- if (not (empty $pullSecrets)) }}
imagePullSecrets:
{{- range $pullSecrets }}
- name: {{ . }}
{{- end }}
{{- end }}
{{- end -}}

{{/*
Return the proper service account name
*/}}
{{- define "app.serviceAccountName" -}}
{{- if .Values.app.serviceAccount.create -}}
    {{ default (include "common.names.fullname" .) .Values.app.serviceAccount.name }}
{{- else -}}
    {{ default "default" .Values.app.serviceAccount.name }}
{{- end -}}
{{- end -}}


{{/*
Return the proper image name for the otel agent
*/}}
{{- define "app.otelAgent.image" -}}
{{- include "common.images.image" (dict "imageRoot" .Values.app.otelAgent.image "global" .Values.global) -}}
{{- end -}}

# TODO: add validations for values
# Remember to add the validation message to NOTES.txt at the end ({{- include "app.validateValues" . }})
{{/*
Compile all warnings into a single message.
*/}}
{{- define "app.validateValues" -}}
{{- $messages := list -}}
{{- $messages := append $messages (include "app.validateValues.foo" .) -}}
{{- $messages := append $messages (include "app.validateValues.bar" .) -}}
{{- $messages := without $messages "" -}}
{{- $message := join "\n" $messages -}}

{{- if $message -}}
  {{- if .Values.global.skipValidationWarnings -}}
    {{- print (printf "\nVALUES VALIDATION WARNINGS:\n%s" $message) -}}
  {{- else -}}
    {{- fail (printf "\nVALUES VALIDATION:\n%s" $message) -}}
  {{- end -}}
{{- end -}}
{{- end -}}
