{{/*
Expand the name of the chart.
*/}}
{{- define "cw-inst.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
Create a default fully qualified app name.
We truncate at 19 chars because the service ID (internally in the cw-inst application)
cannot contain more than 36 chars (where the random hash of the replicaset and pod together with "-" are 17 chars)
If release name contains chart name it will be used as a full name.
*/}}
{{- define "cw-inst.fullname" -}}
{{- if .Values.fullnameOverride }}
{{- .Values.fullnameOverride | trunc 19 | trimSuffix "-" }}
{{- else }}
{{- $name := default .Chart.Name .Values.nameOverride }}
{{- if contains $name .Release.Name }}
{{- .Release.Name | trunc 19 | trimSuffix "-" }}
{{- else }}
{{- printf "%s-%s" .Release.Name $name | trunc 19 | trimSuffix "-" }}
{{- end }}
{{- end }}
{{- end }}

{{/*
Create chart name and version as used by the chart label.
*/}}
{{- define "cw-inst.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
Common labels
*/}}
{{- define "cw-inst.labels" -}}
helm.sh/chart: {{ include "cw-inst.chart" . }}
{{ include "cw-inst.selectorLabels" . }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}

{{/*
Selector labels
*/}}
{{- define "cw-inst.selectorLabels" -}}
app.kubernetes.io/name: {{ include "cw-inst.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}

{{/*
Create the name of the service account to use
*/}}
{{- define "cw-inst.serviceAccountName" -}}
{{- if .Values.serviceAccount.create }}
{{- default (include "cw-inst.fullname" .) .Values.serviceAccount.name }}
{{- else }}
{{- default "default" .Values.serviceAccount.name }}
{{- end }}
{{- end }}

{{/*
Replicas for the deployment
*/}}
{{- define "cw-inst.replicas" -}}
{{- default (add (len .Values.global.config.dus) .Values.fallbackCount) .Values.replicaCount -}}
{{- end }}
