#!/bin/bash

# Refence: https://grafana.com/docs/mimir/latest/operators-guide/deploy-grafana-mimir/jsonnet/deploy/

# Initialize tanka for GKE 1.24
tk init --k8s=1.24
# Install Mimir jsonnet 
jb install github.com/grafana/mimir/operations/mimir@main
# Copy example temaple to 
cp vendor/mimir/mimir-manifests.jsonnet.example environments/default/main.jsonnet
export PAGER=cat
tk show environments/default
tk export manifests environments/default
# Create namespace for mimir
kubectl create namespace monitoring
# Install etcd operator
kubectl apply -f etcd-operator/
# Install HPA KEDA operator
kubectl apply -f https://github.com/kedacore/keda/releases/download/v2.9.3/keda-2.9.3.yaml
# Apply generated manifests with kustomize?
kubectl apply --dry-run=client -k manifests/

