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
{{- end }}


{{/*
dRAX NetConf labels
*/}}
{{- define "five-g-appl.draxNetconfLabels" -}}
drax/role: drax-core
drax/name: {{ .Chart.Name }}
drax/component-name: {{ .Chart.Name }}
drax/component-helm-version: {{ .Chart.Version }}
drax/technology: 5g
drax/instanceId: "{{ tpl .Values.bootstrapId . }}"
drax/5g-component-type: "{{ tpl .Values.initNetconfDefaultPath.componentType . }}"
drax/redis-url: "{{ tpl .Values.redisConfig.hostname . }}"
drax/redis-port: "{{ tpl .Values.redisConfig.port . }}"
drax/component-app-version: "{{ tpl .Values.image.tag . }}"
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

{{/*
NetConf Service name and Instance ID checks
# {{- if mustRegexMatch "[a-z]([-a-z0-9]*[a-z0-9])?" $netconfName }}
# {{- if mustRegexMatch "^[a-zA-Z0-9-]+$" $netconfName }}
*/}}
{{- define "netconf.serviceName" -}}
{{- $netconfName := tpl .Values.bootstrapId . }}
{{- if mustRegexMatch "^[a-z]([a-z0-9-]*[a-z0-9])?$" $netconfName }}
{{- required "A valid netconf service entry required!" $netconfName | trunc 63 | trimSuffix "-" }}
{{- else }}
{{- required "The Instance ID you have chosen is invalid! The Instance ID must consist of lower case alphanumeric characters or '-', start with an alphabetic character, and end with an alphanumeric character (e.g. 'my-name',  or 'abc-123', regex used for validation is '^[a-z]([a-z0-9-]*[a-z0-9])?$'). The Instance ID also cannot be longer than 54 alphanumeric characters!" nil }}
{{- end }}
{{- end }}