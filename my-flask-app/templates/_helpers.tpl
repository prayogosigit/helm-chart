{{/*
Expand the name of the chart, but in this case, we want a fixed name: "my-flask-app"
*/}}
{{- define "my-flask-app.fullname" -}}
my-flask-app
{{- end -}}

{{/*
Define a shorter name for the chart. We'll also return "my-flask-app" directly.
*/}}
{{- define "my-flask-app.name" -}}
my-flask-app
{{- end -}}

{{/*
Labels commonly used in Kubernetes resources like Deployment, Service, etc.
We will use fixed values where appropriate to ensure consistency with the pod name.
*/}}
{{- define "my-flask-app.labels" -}}
app.kubernetes.io/name: {{ include "my-flask-app.name" . }}
helm.sh/chart: {{ .Chart.Name }}-{{ .Chart.Version | replace "+" "_" }}
app.kubernetes.io/instance: my-flask-app  # Use fixed instance name
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end -}}

{{/*
Selector labels for associating resources like Deployments and Services. We will use a consistent app name here.
*/}}
{{- define "my-flask-app.selectorLabels" -}}
app.kubernetes.io/name: {{ include "my-flask-app.name" . }}
app.kubernetes.io/instance: my-flask-app  # Ensure it matches with pod name
{{- end -}}

{{/*
Standard label template for metadata in resources.
*/}}
{{- define "my-flask-app.metadataLabels" -}}
{{ include "my-flask-app.selectorLabels" . }}
{{- end -}}
