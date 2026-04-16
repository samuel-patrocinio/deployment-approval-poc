{{- define "frontend.fullname" -}}
{{ .Release.Name }}
{{- end -}}

{{- define "frontend.labels" -}}
app.kubernetes.io/name: {{ include "frontend.fullname" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end -}}

{{- define "frontend.selectorLabels" -}}
app: {{ include "frontend.fullname" . }}
{{- end -}}
