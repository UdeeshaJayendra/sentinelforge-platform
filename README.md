# SentinelForge Platform

## Autonomous Secure Internal Developer Platform

SentinelForge is a security-focused Internal Developer Platform (IDP) designed to provide developers with a secure, automated path from source code to production deployment.

The platform combines self-service application delivery, secure CI/CD, GitOps, Kubernetes deployment, policy enforcement, observability, and automated release protection.

## Vision

Developers should be able to deploy an application without manually managing the underlying infrastructure, Kubernetes resources, security controls, or deployment process.

SentinelForge aims to provide a secure **golden path**:

```text
Developer
    ↓
SentinelForge
    ↓
Source Control
    ↓
Secure CI/CD
    ↓
Container Registry
    ↓
GitOps
    ↓
Kubernetes
    ↓
Progressive Delivery
    ↓
Observability
    ↓
Automated Release Decision
```

## Core Capabilities

* Developer self-service application deployment
* Infrastructure as Code with Terraform
* Containerized workloads with Docker
* Secure CI/CD with GitHub Actions
* Container vulnerability scanning
* Secret detection
* Software Bill of Materials (SBOM)
* Container image security
* GitOps-based deployment with Argo CD
* Kubernetes policy enforcement
* Progressive delivery and automated rollback
* Prometheus and Grafana observability
* Application health and performance monitoring
* Failure injection and automated recovery demonstrations

## Security Model

SentinelForge follows a defense-in-depth approach:

```text
Source Code
    ↓
Secret Detection
    ↓
Testing
    ↓
Static Analysis
    ↓
Dependency Scanning
    ↓
Container Scanning
    ↓
Image Verification
    ↓
Policy Enforcement
    ↓
Controlled Deployment
    ↓
Runtime Monitoring
```

## Project Goals

The project will demonstrate how a modern platform engineering system can combine:

* Cloud infrastructure
* DevOps
* Kubernetes
* GitOps
* Cloud security
* Software supply-chain security
* Observability
* Progressive delivery
* Automated remediation

## Architecture

The detailed architecture will be documented in:

`docs/architecture/`

Architecture diagrams and design decisions will be added as the platform evolves.

## Development Approach

SentinelForge is developed incrementally.

Each meaningful platform capability is implemented, tested, documented, and committed independently so that the Git history demonstrates the engineering process.

## Status

🚧 Active development

### Planned Milestones

* [ ] Platform foundation
* [ ] AWS infrastructure
* [ ] Kubernetes foundation
* [ ] Developer self-service
* [ ] Secure CI/CD
* [ ] Container registry integration
* [ ] GitOps deployment
* [ ] Policy enforcement
* [ ] Progressive delivery
* [ ] Observability
* [ ] Failure injection
* [ ] Automated rollback
* [ ] Final security and architecture documentation

## Author

**Udeesha Jayendra**

Bachelor of Information and Communication Technology (BICT)

University of Sri Jayewardenepura
