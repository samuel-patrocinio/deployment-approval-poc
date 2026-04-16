{{- define "backend.fullname" -}}
{{ .Release.Name }}
{{- end -}}

{{- define "backend.labels" -}}
app.kubernetes.io/name: {{ include "backend.fullname" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end -}}

{{- define "backend.selectorLabels" -}}
app: {{ include "backend.fullname" . }}
{{- end -}}
