#!/bin/bash

# Update system
echo "Updating system..."
sudo apt update && sudo apt upgrade -y

# Install prerequisites
echo "Installing prerequisites..."
sudo apt install -y apt-transport-https ca-certificates curl software-properties-common gnupg lsb-release unzip

# Check and install Kubernetes CLI (kubectl)
if ! command -v kubectl &> /dev/null; then
  echo "Installing kubectl..."
  curl -LO "https://dl.k8s.io/release/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl"
  sudo install -o root -g root -m 0755 kubectl /usr/local/bin/kubectl
  kubectl version --client --output=yaml
else
  echo "kubectl is already installed."
fi

# Check and install k3d
if ! command -v k3d &> /dev/null; then
  echo "Installing k3d..."
  curl -s https://raw.githubusercontent.com/k3d-io/k3d/main/install.sh | bash
  k3d --version
else
  echo "k3d is already installed."
fi

# Check and install Terraform
if ! command -v terraform &> /dev/null; then
  echo "Installing Terraform..."
  curl -fsSL https://apt.releases.hashicorp.com/gpg | sudo gpg --dearmor -o /usr/share/keyrings/hashicorp-archive-keyring.gpg
  echo "deb [signed-by=/usr/share/keyrings/hashicorp-archive-keyring.gpg] https://apt.releases.hashicorp.com $(lsb_release -cs) main" | sudo tee /etc/apt/sources.list.d/hashicorp.list
  sudo apt update && sudo apt install -y terraform
  terraform -version
else
  echo "Terraform is already installed."
fi

# Check and install Docker
if ! command -v docker &> /dev/null; then
  echo "Installing Docker..."
  sudo apt remove -y docker docker-engine docker.io containerd runc
  sudo apt update
  sudo apt install -y docker.io
  sudo systemctl start docker
  sudo systemctl enable docker
  docker --version

  # Add current user to docker group to avoid using sudo with Docker
  sudo usermod -aG docker $USER
else
  echo "Docker is already installed."
fi

# Check and install AWS CLI
if ! command -v aws &> /dev/null; then
  echo "Installing AWS CLI..."
  curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip"
  unzip awscliv2.zip
  sudo ./aws/install
  aws --version
else
  echo "AWS CLI is already installed."
fi

# Check and install Git
if ! command -v git &> /dev/null; then
  echo "Installing Git..."
  sudo apt install -y git
  git --version
else
  echo "Git is already installed."
fi

# Cleanup
echo "Cleaning up..."
rm -rf kubectl awscliv2.zip ./aws

# Display success message
echo "Installation completed successfully! Please restart your terminal or run 'newgrp docker' to apply Docker group changes."
