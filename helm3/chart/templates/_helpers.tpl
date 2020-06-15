{{/* vim: set filetype=mustache: */}}
{{/*
Expand the name of the chart.
*/}}
{{- define "app.name" -}}
{{- default .Values.appName | trunc 63 | trimSuffix "-" -}}
{{- end -}}


{{/*
Create chart name and version as used by the chart label.
*/}}
{{- define "app.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" -}}
{{- end -}}

{{/*
Common labels
*/}}
{{- define "app.labels" -}}
helm.sh/chart: {{ include "app.chart" . }}
{{ include "app.selectorLabels" . }}
{{- if .Chart.AppVersion }}
version: {{ .Chart.AppVersion | quote }}
{{- end }}
managed-by: {{ .Release.Service }}
deployment-type: {{ .Values.deploymenttype }}
environment: {{ .Values.environment}}
{{- end -}}

{{/*
Selector labels
*/}}
{{- define "app.selectorLabels" -}}
app: {{ .Release.Name }}
component-of: {{ include "app.name" . }}
{{- end -}}

