# gcp_test

## Project Overview

This project aims to set up a web application using Express and MongoDB that is containerized with Docker and deployed on Google Kubernetes Engine (GKE) via Terraform.

## Directory Structure

```
.
├── 1-hello-app-deployment.yaml       # Kubernetes deployment manifest for the web application
├── 2-hello-app-hpa.yaml              # HorizontalPodAutoscaler manifest for the deployment
├── 3-hello-app-service.yaml          # Kubernetes service manifest to expose the deployment
├── Dockerfile                        # Dockerfile for building the web application's container image
├── LICENSE                           # License file for the project
├── README.md                         # This README file
├── mongo                             # Source code and related files for the Express web application
│   ├── package-lock.json             # Lock file for npm dependencies
│   ├── package.json                  # npm package file
│   ├── server.js                     # Entry point for the Express application
│   └── views                         # EJS template files
│       └── list.ejs                  # EJS template for the list view
└── terraform                         # Terraform configurations to deploy infrastructure on GCP
    ├── main.tf                       # Main Terraform configuration file
    ├── modules                       # Terraform modules for modular configurations
    │   ├── gke_cluster               # Module for GKE cluster creation
    │   │   ├── main.tf               # Configuration file for GKE cluster module
    │   │   └── variables.tf          # Variables definition for GKE cluster module
    │   └── networking                # Module for networking (VPC, subnets, etc.)
    │       ├── main.tf               # Configuration file for networking module
    │       ├── outputs.tf            # Outputs definition for networking module
    │       └── variables.tf          # Variables definition for networking module
    ├── provider.tf                   # Terraform provider configuration
    ├── terraform.tfstate             # Terraform state file
    ├── terraform.tfstate.backup      # Backup of Terraform state file
    ├── terraform.tfvars              # Terraform variables values
    ├── tfvars                        # Terraform variables file (alternative to terraform.tfvars)
    └── variables.tf                  # Variables definition for main Terraform configuration
```

## Setup and Deployment

1. Build the Docker image:
   ```bash
   docker build -t [YOUR_IMAGE_NAME]:v6 .
   ```

2. Deploy the infrastructure using Terraform:
   ```bash
   cd terraform
   terraform init
   terraform apply
   ```

3. Deploy the application to GKE:
   ```bash
   kubectl apply -f 1-hello-app-deployment.yaml
   kubectl apply -f 2-hello-app-hpa.yaml
   kubectl apply -f 3-hello-app-service.yaml
   ```

Note: Always ensure sensitive data (like API keys or secrets) are not committed to the repository and are managed securely.

## Author

- Alejandro Piña ([email](mailto:alexander.pinna@protonmail.com))