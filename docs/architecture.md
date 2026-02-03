# Architecture Overview

KubeForge follows a layered DevOps architecture.

## Infrastructure Layer
- AWS VPC provides isolated networking
- Public subnets host ALB
- Private subnets host EKS worker nodes
- Terraform manages all infrastructure declaratively

## CI/CD Layer
- Jenkins orchestrates build and deployment pipelines
- Docker images are built during CI
- CD stages are gated for cost and safety

## Application Layer
- Kubernetes manages application lifecycle
- Two deployments (Blue and Green) run in parallel
- Kubernetes Service controls traffic routing

## Traffic Flow
User
→ AWS ALB (Ingress)
→ Kubernetes Service
→ Blue or Green Pods

## Observability Layer
- Prometheus scrapes Kubernetes metrics
- Grafana visualizes pod and deployment behavior
