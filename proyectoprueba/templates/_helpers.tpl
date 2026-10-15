{{/*
Expand the name of the chart.
*/}}
{{- define "proyectoprueba.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
Create a default fully qualified app name.
We truncate at 63 chars because some Kubernetes name fields are limited to this (by the DNS naming spec).
If release name contains chart name it will be used as a full name.
*/}}
{{- define "proyectoprueba.fullname" -}}
{{- if .Values.fullnameOverride }}
{{- .Values.fullnameOverride | trunc 63 | trimSuffix "-" }}
{{- else }}
{{- $name := default .Chart.Name .Values.nameOverride }}
{{- if contains $name .Release.Name }}
{{- .Release.Name | trunc 63 | trimSuffix "-" }}
{{- else }}
{{- printf "%s-%s" .Release.Name $name | trunc 63 | trimSuffix "-" }}
{{- end }}
{{- end }}
{{- end }}

{{/*
Create chart name and version as used by the chart label.
*/}}
{{- define "proyectoprueba.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
Common labels
*/}}
{{- define "proyectoprueba.labels" -}}
app: {{ include "proyectoprueba.name" . }}
app.openshift.io/runtime: quarkus
{{- end }}

{{/*
Selector labels
*/}}
{{- define "proyectoprueba.selectorLabels" -}}
app: {{ include "proyectoprueba.name" . }}
{{- end }}

{{/*
Create the name of the service account to use
*/}}
{{- define "proyectoprueba.serviceAccountName" -}}
{{- if .Values.serviceAccount.create }}
{{- default (include "proyectoprueba.fullname" .) .Values.serviceAccount.name }}
{{- else }}
{{- default "default" .Values.serviceAccount.name }}
{{- end }}
{{- end }}
