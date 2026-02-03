# KubeForge CI/CD Platform

## Overview
KubeForge is a production-grade CI/CD platform that automates the build, test, and deployment of containerized microservices on Kubernetes using a Blue-Green deployment strategy.  
The entire infrastructure is provisioned using Terraform on AWS, CI/CD is orchestrated using Jenkins, and system observability is achieved using Prometheus and Grafana.

## Tech Stack
- AWS (EKS, VPC, IAM, ALB)
- Terraform (Infrastructure as Code)
- Jenkins (CI/CD)
- Docker (Containerization)
- Kubernetes (Container Orchestration)
- Prometheus & Grafana (Monitoring & Visualization)

## Architecture
The platform follows a modular and production-style architecture:

- Jenkins handles CI/CD automation
- Docker images are built and versioned using Git commit hashes
- Kubernetes runs two parallel deployments (Blue & Green)
- Traffic is switched instantly using Kubernetes Service selectors
- Ingress backed by AWS ALB exposes the application
- Prometheus scrapes metrics from Kubernetes
- Grafana visualizes deployment and pod behavior

## CI/CD Flow
1. Code push triggers Jenkins pipeline
2. Jenkins builds Docker image
3. Image is tagged using Git commit hash
4. Green version is deployed to Kubernetes
5. Jenkins waits for Green pods to become ready
6. Service selector is switched from Blue → Green
7. Blue remains available for instant rollback

## Blue-Green Deployment Strategy
- Both Blue and Green versions run simultaneously
- Traffic switching is handled at the Kubernetes Service level
- No pod restarts or ingress reloads during deployment
- Rollback is instant by reverting Service selector

## Monitoring & Observability
- Prometheus scrapes pod-level metrics from Kubernetes
- Grafana visualizes pod counts and deployment behavior
- Monitoring validates zero-downtime deployments

## Cost Strategy
To minimize cloud costs:
- Infrastructure is fully designed and validated before deployment
- AWS resources are applied only once for final testing
- Resources are destroyed immediately after validation

## Status
✔ Infrastructure design complete  
✔ CI/CD pipeline complete  
✔ Blue-Green deployment implemented  
✔ Monitoring and visualization added  

