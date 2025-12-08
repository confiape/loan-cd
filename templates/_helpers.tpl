{{/*
Expand the name of the chart.
*/}}
{{- define "ConfiaPe.Loans.CD.name" -}}
{{- default .Chart.Name .Values.nameOverride | replace "." "-" | lower | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
Create a default fully qualified app name.
We truncate at 63 chars because some Kubernetes name fields are limited to this (by the DNS naming spec).
If release name contains chart name it will be used as a full name.
*/}}
{{- define "ConfiaPe.Loans.CD.fullname" -}}
{{- if .Values.fullnameOverride }}
{{- .Values.fullnameOverride | replace "." "-" | lower | trunc 63 | trimSuffix "-" }}
{{- else }}
{{- $name := default .Chart.Name .Values.nameOverride }}
{{- if contains $name .Release.Name }}
{{- .Release.Name | replace "." "-" | lower | trunc 63 | trimSuffix "-" }}
{{- else }}
{{- printf "%s-%s" .Release.Name $name | replace "." "-" | lower | trunc 63 | trimSuffix "-" }}
{{- end }}
{{- end }}
{{- end }}

{{/*
Create chart name and version as used by the chart label.
*/}}
{{- define "ConfiaPe.Loans.CD.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | replace "." "-" | lower | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
Common labels
*/}}
{{- define "ConfiaPe.Loans.CD.labels" -}}
helm.sh/chart: {{ include "ConfiaPe.Loans.CD.chart" . }}
{{ include "ConfiaPe.Loans.CD.selectorLabels" . }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}

{{/*
Selector labels
*/}}
{{- define "ConfiaPe.Loans.CD.selectorLabels" -}}
app.kubernetes.io/name: {{ include "ConfiaPe.Loans.CD.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}

{{/*
Create the name of the service account to use
*/}}
{{- define "ConfiaPe.Loans.CD.serviceAccountName" -}}
{{- if .Values.serviceAccount.create }}
{{- default (include "ConfiaPe.Loans.CD.fullname" .) .Values.serviceAccount.name }}
{{- else }}
{{- default "default" .Values.serviceAccount.name }}
{{- end }}
{{- end }}
