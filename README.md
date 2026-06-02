# Cloud-Native CI/CD Portfolio Deployment System

Live Demo: https://56.68.118.22

## Overview

This project demonstrates a **production-style CI/CD pipeline on AWS**, focusing on:

- Secure cloud authentication using **AWS OIDC federation**
- Remote deployment via **AWS Systems Manager (SSM)**
- Containerized application delivery using **Docker + Amazon ECR**
- Fully automated **GitHub Actions CI/CD workflow**
- Clean separation of **configuration via environment variables**

The application itself is a **static HTML portfolio**, intentionally kept minimal to emphasize infrastructure design, deployment automation, and cloud security practices.

---

## Core Engineering Focus

This project is designed to highlight real-world cloud engineering capabilities:

### 🔐 Secure Access Control (IAM + OIDC)
- Uses GitHub Actions OIDC to assume an AWS IAM role
- Eliminates long-term AWS credentials (no static access keys)
- Implements least-privilege access via role-based permissions

### ⚙️ Remote Operations (AWS SSM)
- EC2 instance is managed via AWS Systems Manager
- No SSH key management required
- Enables secure, auditable remote command execution

### 📦 Containerized Deployment
- Application packaged as a Docker image
- Deployed via Amazon ECR (Elastic Container Registry)
- NGINX container serves static assets efficiently

### 🚀 CI/CD Automation (GitHub Actions)
- Automated pipeline triggered on push to `master`
- Includes build, test, containerization, and deployment stages
- Ensures consistent and repeatable deployments

### 🔧 Configuration Management
- Environment-specific values managed via GitHub Variables
- No hardcoded AWS resources in pipeline
- Supports scalable multi-environment design (dev/staging/prod-ready structure)

---

## Architecture Overview

```mermaid
flowchart TD

    A[GitHub Push to master] --> B[GitHub Actions CI/CD Pipeline]

    subgraph CI Pipeline
        B1[Checkout Code]
        B2[Build Static Asset]
        B3[Docker Image Build]
        B4[Push to Amazon ECR]
    end

    B --> B1 --> B2 --> B3 --> B4

    subgraph AWS Authentication
        C1[GitHub OIDC]
        C2[Assume IAM Role]
    end

    B4 --> C1 --> C2

    subgraph Deployment Layer
        D1[AWS Systems Manager (SSM)]
        D2[EC2 Instance]
        D3[Docker Container - NGINX]
        D4[Static Portfolio Served]
    end

    C2 --> D1 --> D2 --> D3 --> D4