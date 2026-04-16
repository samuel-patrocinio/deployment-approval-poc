{{- define "scheduler.fullname" -}}
{{ .Release.Name }}
{{- end -}}

{{- define "scheduler.labels" -}}
app.kubernetes.io/name: {{ include "scheduler.fullname" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end -}}
