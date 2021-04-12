{{/*
Expand the name of the chart.
*/}}
{{- define "acc-5g-cu-up.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
Create a default fully qualified app name.
We truncate at 63 chars because some Kubernetes name fields are limited to this (by the DNS naming spec).
If release name contains chart name it will be used as a full name.
*/}}
{{- define "acc-5g-cu-up.fullname" -}}
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
{{- define "acc-5g-cu-up.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
Common labels
*/}}
{{- define "acc-5g-cu-up.labels" -}}
helm.sh/chart: {{ include "acc-5g-cu-up.chart" . }}
{{ include "acc-5g-cu-up.selectorLabels" . }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}

{{/*
Selector labels
*/}}
{{- define "acc-5g-cu-up.selectorLabels" -}}
app.kubernetes.io/name: {{ include "acc-5g-cu-up.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}

{{/*
Create the name of the service account to use
*/}}
{{- define "acc-5g-cu-up.serviceAccountName" -}}
{{- if .Values.serviceAccount.create }}
{{- default (include "acc-5g-cu-up.fullname" .) .Values.serviceAccount.name }}
{{- else }}
{{- default "default" .Values.serviceAccount.name }}
{{- end }}
{{- end }}

{{/*
Pre-Flight Instance ID Check
# {{- if mustRegexMatch "[a-z]([-a-z0-9]*[a-z0-9])?" $instanceId }}
# {{- if mustRegexMatch "^[a-zA-Z0-9-]+$" $instanceId }}
*/}}
{{- define "preFlightCheck.instanceId" -}}
{{- $instanceId := tpl .Values.global.instanceId . }}
{{- if mustRegexMatch "^[a-z]([a-z0-9-]*[a-z0-9])?$" $instanceId }}
{{- required "A valid netconf service entry required!" $instanceId | trunc 63 | trimSuffix "-" }}
{{- else }}
{{- required "The Instance ID you have chosen is invalid! The Instance ID must consist of lower case alphanumeric characters or '-', start with an alphabetic character, and end with an alphanumeric character (e.g. 'my-name',  or 'abc-123', regex used for validation is '^[a-z]([a-z0-9-]*[a-z0-9])?$'). The Instance ID also cannot be longer than 54 alphanumeric characters!" nil }}
{{- end }}
{{- end }}

