#!/bin/bash

# Step 1: Verify the cluster is running
echo "Checking if the cluster is running..."
kubectl cluster-info

# Step 2: Install Tekton Pipelines
echo "Installing Tekton Pipelines..."
kubectl apply --filename https://storage.googleapis.com/tekton-releases/pipeline/latest/release.yaml

# Step 3: Monitor the Tekton Pipelines components until all components show a STATUS of Running
echo "Waiting for Tekton Pipelines to become ready..."
kubectl wait --for=condition=ready pods --all -n tekton-pipelines --timeout=300s

# Step 4: Verify Tekton Pipelines installation
echo "Checking the installation of Tekton Pipelines..."
kubectl get pods --namespace tekton-pipelines

#!/bin/bash

# Check kubectl version
kubectl version --client

# Validate the Kubernetes cluster information
kubectl cluster-info

# Check available nodes
kubectl get nodes

# Install Tekton Pipelines
kubectl apply --filename https://storage.googleapis.com/tekton-releases/pipeline/latest/release.yaml

# Monitor the Tekton Pipelines components until all components show a `STATUS` of `Running`
kubectl get pods --namespace tekton-pipelines

# Verify the installation
kubectl get crds | grep 'tekton.dev'

# Install Tekton Triggers
kubectl apply -f https://storage.googleapis.com/tekton-releases/triggers/latest/release.yaml
kubectl apply --filename https://storage.googleapis.com/tekton-releases/triggers/latest/interceptors.yaml

# Verify that the installation succeeded
kubectl get pods --namespace tekton-pipelines

cat <<EOF


Use one of the following methods to install the Tekton CLI:

# Mac
brew install tektoncd-cli

# Windows
choco install tektoncd-cli --confirm

# Linux RPM & dnf/yum
sudo dnf copr enable -y chmouel/tektoncd-cli
sudo dnf install -y tektoncd-cli

# Linux Deb
curl -LO https://github.com/tektoncd/cli/releases/download/v0.31.2/tektoncd-cli-0.31.2_Linux-64bit.deb
sudo dpkg -i ./tektoncd-cli-0.31.2_Linux-64bit.deb

Then verify installation by running "tkn"
EOF
