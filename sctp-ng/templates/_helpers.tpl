{{/*
Expand the name of the chart.
*/}}
{{- define "five-g-appl.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
Create a default fully qualified app name.
We truncate at 63 chars because some Kubernetes name fields are limited to this (by the DNS naming spec).
If release name contains chart name it will be used as a full name.
*/}}
{{- define "five-g-appl.fullname" -}}
{{- if .Values.fullnameOverride }}
{{- .Values.fullnameOverride | trunc 63 | trimSuffix "-" }}
{{- else }}
{{- $name := default .Chart.Name .Values.nameOverride }}
{{- printf "%s-%s" .Release.Name $name | trunc 63 | trimSuffix "-" }}
{{- end }}
{{- end }}

{{/*
Create chart name and version as used by the chart label.
*/}}
{{- define "five-g-appl.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
Common labels
*/}}
{{- define "five-g-appl.labels" -}}
helm.sh/chart: {{ include "five-g-appl.chart" . }}
{{ include "five-g-appl.selectorLabels" . }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
drax/role: 5g
drax/name: 5g
drax/component-name: {{ .Chart.Name }}
drax/component-version: {{ .Chart.Version }}
drax/technology: 5g
drax/instanceId: "{{ tpl .Values.bootstrapId . }}"
drax/redis-url: "{{ tpl .Values.redisConfig.hostname . }}"
drax/redis-port: "{{ tpl .Values.redisConfig.port . }}"
drax/helm-version: "{{ tpl .Values.global.helmVersion . }}"
drax/5g-version: "{{ tpl .Values.global.tag . }}"
{{- end }}

{{/*
Common labels
*/}}
{{- define "sctp.labels" -}}
helm.sh/chart: {{ include "five-g-appl.chart" . }}
{{ include "five-g-appl.selectorLabels" . }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
drax/role: 5g
drax/name: 5g
drax/component-name: {{ .Chart.Name }}
drax/component-version: {{ .Chart.Version }}
drax/technology: 5g
drax/instanceId: "{{ tpl .Values.bootstrapId . }}"
drax/redis-url: "{{ tpl .Values.redisConfig.hostname . }}"
drax/redis-port: "{{ tpl .Values.redisConfig.port . }}"
drax/helm-version: "{{ tpl .Values.global.helmVersion . }}"
drax/5g-version: "{{ tpl .Values.global.tag . }}"
{{- end }}


{{/*
Selector labels
*/}}
{{- define "five-g-appl.selectorLabels" -}}
app.kubernetes.io/name: {{ include "five-g-appl.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}

{{/*
Create the name of the service account to use
*/}}
{{- define "five-g-appl.serviceAccountName" -}}
{{- if .Values.serviceAccount.create }}
{{- default (include "five-g-appl.fullname" .) .Values.serviceAccount.name }}
{{- else }}
{{- default "default" .Values.serviceAccount.name }}
{{- end }}
{{- end }}
