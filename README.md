# Basic Linux System Setup Script

This repository contains a Bash script designed to quickly set up essential tools on a new Ubuntu Linux system. It ensures that commonly required developer and DevOps tools are installed, up-to-date, and ready for use. The script also checks for existing installations, preventing redundant installations.

## Tools Installed

- **Unzip**: command-line utility used to extract files from ZIP archive files.
- **Kubernetes CLI (kubectl)**: Manage Kubernetes clusters from the command line.
- **k3d**: Lightweight Kubernetes clusters in Docker.
- **Terraform**: Infrastructure-as-code tool for managing resources.
- **Docker**: Containerization platform for building and managing containers.
- **AWS CLI**: Manage AWS services from the command line.
- **Git**: Version control system for managing source code.

## Features

- Checks if tools are already installed and skips them if they are.
- Automates system updates and prerequisite installations.
- Configures Docker for non-root usage.
- Cleans up temporary files after installation.

## Usage

1. Clone the repository:

   ```bash
   git clone https://github.com/aadi308/basic-linux-setup.git
   cd basic-linux-setup

## Run the script

```bash
chmod +x install_tools.sh
./install_tools.sh
```

Restart your terminal or run `newgrp docker` to apply Docker group changes.

## Target Audience

This script is ideal for:

- Developers who need a reliable setup for development tools.
- DevOps engineers looking for a quick way to set up a development environment.
- System administrators who want to streamline the installation of essential tools on new Ubuntu systems.

Feel free to contribute or suggest improvements to this script!
