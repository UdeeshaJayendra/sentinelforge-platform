# SentinelForge — Autonomous Secure Developer Platform

> A lightweight, security-focused Internal Developer Platform (IDP) that combines AWS, Terraform, Kubernetes, secure CI/CD, GitOps, progressive delivery, container security, and automated failure handling.

---

## 1. Project Overview

**SentinelForge** is a secure developer platform designed to demonstrate a complete modern software delivery lifecycle.

It integrates:

* AWS cloud infrastructure
* Terraform Infrastructure as Code
* Kubernetes / k3s
* GitHub Actions
* Gitleaks
* Trivy
* SBOM generation
* Cosign image signing and verification
* Amazon ECR
* GitHub OIDC
* Argo CD
* Argo Rollouts
* Kubernetes NetworkPolicy
* Readiness probes
* Canary deployments
* Automated rollout abort
* GitOps-based recovery

The platform is intentionally designed to run on a **small AWS environment**, using a single `t3.small` EC2 platform node.

---

# 2. Architecture

The SentinelForge delivery flow is:
<img width="1024" height="1536" alt="image" src="https://github.com/user-attachments/assets/ce50dce0-883d-45e6-a52b-101ed8a5c341" />
---

# 3. Project Objectives

The main objectives of SentinelForge are to demonstrate:

1. Infrastructure automation using Terraform.
2. Lightweight Kubernetes deployment using k3s.
3. Secure CI/CD using GitHub Actions.
4. Container vulnerability scanning.
5. Secret detection.
6. Software Bill of Materials generation.
7. Container image signing and verification.
8. Secure authentication between GitHub and AWS using OIDC.
9. GitOps deployment using Argo CD.
10. Progressive delivery using Argo Rollouts.
11. Kubernetes network isolation.
12. Automated detection of unhealthy application releases.
13. Automatic rollout abortion when a release fails.
14. Recovery to a healthy stable release.

---

# 4. Technology Stack

## Cloud

* Amazon Web Services (AWS)
* Amazon EC2
* Amazon VPC
* Amazon ECR
* AWS IAM
* GitHub OIDC

## Infrastructure

* Terraform
* Ubuntu 24.04
* k3s
* Kubernetes

## CI/CD & Security

* GitHub Actions
* Docker
* Gitleaks
* Trivy
* CycloneDX SBOM
* Cosign

## GitOps & Deployment

* Argo CD
* Argo Rollouts
* Traefik
* Kubernetes NetworkPolicy

## Application

* Node.js
* Express
* Docker

---

# 5. AWS Infrastructure

SentinelForge uses a lightweight AWS architecture consisting primarily of a single EC2 platform node running k3s.

## Kubernetes Control-Plane Node

The Kubernetes control-plane node was successfully deployed on AWS.

### Screenshot 01 — Kubernetes Control-Plane Node

![Kubernetes control-plane node](docs/screenshots/01-kubernetes-control-plane-node.png)

**Evidence:** AWS EC2 platform node successfully deployed.

---

## k3s System Pods

The k3s system components were successfully started on the platform node.

### Screenshot 02 — k3s System Pods Running

<img width="1131" height="206" alt="2  k3s-system-pods-running" src="https://github.com/user-attachments/assets/dd7e89c0-3db8-4754-aba8-59061c2ffa50" />

**Evidence:** Kubernetes system pods are running successfully.

---

# 6. Kubernetes Platform

SentinelForge uses **k3s**, a lightweight Kubernetes distribution suitable for a small cloud environment.

## Kubernetes Ingress Routing

Traefik is used as the Kubernetes ingress controller.

### Screenshot 03 — Kubernetes Ingress Routing

<img width="1551" height="310" alt="3kubernetes-ingress-routing" src="https://github.com/user-attachments/assets/2fed51c0-296b-4050-97d7-8b50c59a04ff" />

**Evidence:** Application ingress is configured through Traefik.

---

## Argo CD Core

Argo CD is deployed inside the Kubernetes environment and manages the desired application state from Git.

### Screenshot 04 — Argo CD Core Running

<img width="1562" height="616" alt="4 Argo CD Core running" src="https://github.com/user-attachments/assets/0b98006d-2c25-448e-8371-d39a09ffc53c" />

**Evidence:** Argo CD components are running successfully.

---

## Kubernetes Cluster Health

### Screenshot 05 — Kubernetes Cluster Health

<img width="1513" height="462" alt="5 Kubernetes cluster health" src="https://github.com/user-attachments/assets/622a1076-33d8-41ad-8410-aeb08762e438" />

**Evidence:** Kubernetes cluster and workloads are operational.

---

# 7. GitOps

SentinelForge follows a GitOps model where Git contains the desired Kubernetes state.

Argo CD continuously reconciles the Kubernetes environment with the Git repository.

## Automated GitOps Scaling

### Screenshot 06 — Automated GitOps Scaling

<img width="1522" height="312" alt="6 gitops-automated-scaling-proof" src="https://github.com/user-attachments/assets/ef47ab9f-7429-4d58-abd2-3eb607f760b2" />

**Evidence:** Kubernetes desired-state changes are automatically reconciled through GitOps.

---

# 8. Secure CI/CD Pipeline

The CI/CD pipeline performs security and deployment validation before an application image is delivered to Kubernetes.

The pipeline contains three main jobs:

```text
Git Push
   │
   ├── Validate Kubernetes Manifests
   │
   ├── Scan for Secrets
   │
   └── Build and Scan Container
```

---

# 9. Container Security

## Trivy Security Scan

Trivy scans the application container for security vulnerabilities.

### Screenshot 07 — Trivy Security Scan

<img width="1872" height="846" alt="8 trivy-security-scan-success" src="https://github.com/user-attachments/assets/d4cbdcb5-006c-49d2-b9ce-f3f23c5d91aa" />

**Evidence:** Container security scanning completed successfully.

---

## Amazon ECR Container Image

The validated container image is stored in Amazon ECR.

### Screenshot 08 — ECR Container Image

<img width="1891" height="474" alt="9 ecr-container-image" src="https://github.com/user-attachments/assets/7139e7ab-1616-4c81-9a5e-afc01d711ba7" />

**Evidence:** SentinelForge application container image is available in Amazon ECR.

---

# 10. Argo Rollouts

SentinelForge uses Argo Rollouts for progressive delivery.

Instead of immediately replacing the existing application, a new version is introduced through a controlled canary rollout.

## Argo Rollouts Namespace

### Screenshot 09 — Argo Rollouts Namespace

<img width="1597" height="387" alt="10 argo-rollouts-namespace" src="https://github.com/user-attachments/assets/af00dd3b-3712-4df5-abc0-1a3afdeaee6f" />

**Evidence:** Argo Rollouts is deployed in the Kubernetes environment.

---

## Healthy Rollout

### Screenshot 10 — Argo Rollouts Healthy

<img width="1601" height="702" alt="11 argo-rollouts-healthy" src="https://github.com/user-attachments/assets/0ab40c4f-e604-46e9-bab7-aae8cbdeba81" />

**Evidence:** Rollout controller reports a healthy application deployment.

---

# 11. Canary Deployment

SentinelForge uses a canary strategy to gradually introduce new application versions.

The rollout process is:

```text
New Release
     │
     ▼
  50% Canary
     │
     ▼
   Pause
     │
     ├── Healthy ──────► Promote to 100%
     │
     └── Unhealthy ────► Automatic Abort
```

## Canary Paused

### Screenshot 11 — Canary Paused

<img width="1572" height="578" alt="12 argo-rollouts-canary-paused" src="https://github.com/user-attachments/assets/469d647e-7efa-4445-a724-566fb2d9056e" />

**Evidence:** The new version is paused at the canary stage before full promotion.

---

## Canary Promoted

### Screenshot 12 — Canary Promoted

<img width="1605" height="695" alt="13 argo-rollouts-canary-promoted" src="https://github.com/user-attachments/assets/10073ce1-2b1c-4f01-8cca-67693208439c" />

**Evidence:** A healthy canary release was promoted toward full traffic.

---

# 12. Automated Failure Handling

One of the main SentinelForge demonstrations is controlled failure handling.

A deliberately faulty application release was introduced.

The faulty release returned an HTTP `500` response, causing the Kubernetes readiness probe to fail.


This allows the rollout controller to automatically abort an unhealthy release.

---

## Automatic Rollout Abort

### Screenshot 13 — Automatic Rollout Abort

<img width="1602" height="760" alt="14 argo-rollouts-automatic-abort" src="https://github.com/user-attachments/assets/64e92a0f-ca60-475c-8219-ed6cae69f27f" />

**Evidence:** The unhealthy rollout was automatically aborted.

This demonstrates that SentinelForge does not simply deploy a new version and hope that it works.

The deployment health is actively monitored during progressive delivery.

---

# 13. Container Image Signing

SentinelForge uses **Cosign** to provide cryptographic signing and verification of container images.

## Cosign Signature Verification

### Screenshot 14 — Cosign Signature Verification

<img width="1902" height="838" alt="18 cosign-signature-verification png" src="https://github.com/user-attachments/assets/04ecc4a3-6a0f-4153-b1c2-49375650a351" />

**Evidence:** The container image signature was successfully verified using the trusted GitHub Actions identity.

---

# 14. Software Bill of Materials

SentinelForge generates an SBOM for the container image using Trivy and CycloneDX.

The SBOM provides information about the software components contained within the application image.

## SBOM Generation

### Screenshot 15 — SBOM Generation

<img width="1880" height="701" alt="19 sbom-generation" src="https://github.com/user-attachments/assets/421f62ee-6157-4561-9a70-9cb2c707b00f" />

**Evidence:** SBOM generation and artifact upload completed successfully.

---

# 15. Secret Detection

Gitleaks is integrated into the CI/CD pipeline to detect accidentally committed secrets.

## Gitleaks Secret Scan

### Screenshot 16 — Gitleaks Secret Scan

<img width="1888" height="897" alt="20 gitleaks-secret-scan" src="https://github.com/user-attachments/assets/d47ac4c1-c7f8-49d0-a685-9891affede40" />

**Evidence:** Repository secret scanning completed with no detected leaks.

---

# 16. Kubernetes Security Policy

SentinelForge also performs Kubernetes security policy validation inside CI.

The pipeline checks for:

* Readiness probes
* Resource requests
* Resource limits
* No privileged containers
* NetworkPolicy

## Kubernetes Security Policy CI

### Screenshot 17 — Kubernetes Security Policy CI

<img width="1876" height="538" alt="21 kubernetes-security-policy-ci" src="https://github.com/user-attachments/assets/1c8cef5e-08be-4783-94e0-97394071c358" />

**Evidence:** Kubernetes security policy validation passed.

---

# 17. Network Security

SentinelForge uses Kubernetes NetworkPolicy to restrict workload communication.

The application is configured to accept ingress traffic from the Traefik ingress controller and restrict egress traffic to required destinations.

## NetworkPolicy Enforcement

### Screenshot 18 — NetworkPolicy Enforcement

<img width="1597" height="687" alt="22 networkpolicy-enforcement" src="https://github.com/user-attachments/assets/76cdf745-573d-47a7-9d78-5efe7a8dde53" />

**Evidence:** Kubernetes NetworkPolicy is configured with both ingress and egress restrictions.

---

# 18. Live Application Verification

After the deployment and recovery process, the application was tested through the Kubernetes ingress path.

The application returned:

```text
HTTP/1.1 200 OK
```

with:

```json
{
  "service": "sentinelforge-demo",
  "status": "healthy",
  "version": "v2-canary"
}
```

## Live Application Health

### Screenshot 19 — Live Application Health

<img width="1286" height="277" alt="23 live-application-health png" src="https://github.com/user-attachments/assets/a3424b41-ab8d-4998-a8ac-ed194bb9a12f" />

**Evidence:** The live application is reachable and returning a healthy response.

---

# 19. Rollout Recovery

After the unhealthy release was aborted, SentinelForge returned to a healthy stable release.

The Rollout controller recorded the recovery and ReplicaSet changes.

## Rollout Recovery Events

### Screenshot 20 — Rollout Recovery Events

<img width="1601" height="695" alt="25 rollout-recovery-events png" src="https://github.com/user-attachments/assets/eebb2f35-22aa-485e-826d-8ce42bd6b2f4" />

**Evidence:** Rollout controller events show stable ReplicaSet handling and progression to the healthy release.

---

# 20. Final GitOps State

Argo CD provides the final GitOps synchronization state.

## Argo CD Final State

### Screenshot 21 — Argo CD Synced and Healthy

<img width="1563" height="150" alt="26 argocd-final-synced-healthy png" src="https://github.com/user-attachments/assets/ea2c05f7-ef84-435e-bc7d-b459e8f1534d" />


# 21. Final Argo Rollouts State

The final rollout reached 100% and the healthy version became stable.

## Argo Rollouts Final Health

### Screenshot 22 — Final Argo Rollouts Health

<img width="1610" height="653" alt="27 argo-rollouts-final-healthy png" src="https://github.com/user-attachments/assets/7bbb9995-c2c0-42c1-a8d8-c3ac2ffbb530" />


This confirms that the final application release is healthy and stable.

---

# 22. GitHub Actions Evidence

The final healthy release was processed through the GitHub Actions pipeline.

The workflow contains three major jobs:



## Complete Healthy Release Workflow

### Screenshot 23 — GitHub Actions Healthy Release

<img width="1883" height="792" alt="30 github-actions-healthy-release-success" src="https://github.com/user-attachments/assets/a1f2116f-c793-4b12-9724-199947657b52" />

**Evidence:** The complete GitHub Actions workflow completed successfully.

---

## Validate Kubernetes Manifests

### Screenshot 24 — Validate Kubernetes Manifests

<img width="1887" height="732" alt="31 Validate Kubernetes Manifests" src="https://github.com/user-attachments/assets/5acc7724-eae5-4e15-8f96-5aeb18e8a515" />

**Evidence:** Kubernetes manifests were successfully validated before deployment.

---

## Scan for Secrets

### Screenshot 25 — Scan for Secrets

<img width="1901" height="648" alt="32 Scan for Secrets" src="https://github.com/user-attachments/assets/f1ce9d86-bff6-4ae1-8402-2c26d88a1f4e" />

**Evidence:** Secret scanning completed successfully.

---

## Build and Scan Container

### Screenshot 26 — Build and Scan Container

<img width="1883" height="887" alt="33 Build and Scan Container" src="https://github.com/user-attachments/assets/9c36732d-bdb4-4dcf-894d-9329df1fc2c0" />

**Evidence:** The application container was built and security checks were executed successfully.

---

## GitHub Actions Workflow History

### Screenshot 27 — All GitHub Workflows

<img width="1875" height="898" alt="34 git hub All workflows" src="https://github.com/user-attachments/assets/0711a3e9-4ccb-4964-a475-f5b87bd17b76" />

**Evidence:** GitHub Actions workflow history demonstrates repeated CI/CD execution.

---

# 23. Security Controls

| Security Area        | Implementation               |
| -------------------- | ---------------------------- |
| Secret Detection     | Gitleaks                     |
| Container Scanning   | Trivy                        |
| SBOM                 | CycloneDX                    |
| Image Signing        | Cosign                       |
| Image Verification   | Cosign                       |
| Container Registry   | Amazon ECR                   |
| Cloud Authentication | GitHub OIDC                  |
| Network Isolation    | Kubernetes NetworkPolicy     |
| Readiness Checking   | Kubernetes Readiness Probe   |
| Resource Governance  | CPU/Memory Requests & Limits |
| Progressive Delivery | Argo Rollouts                |
| GitOps               | Argo CD                      |
| Failure Handling     | Automatic Rollout Abort      |

---

---



# Project Outcome

SentinelForge demonstrates a complete secure delivery platform:

```text
Source Code
     ↓
CI Validation
     ↓
Secret Scanning
     ↓
Container Build
     ↓
Vulnerability Scanning
     ↓
SBOM
     ↓
Image Signing
     ↓
Image Verification
     ↓
Amazon ECR
     ↓
GitOps
     ↓
Kubernetes
     ↓
Canary Deployment
     ↓
Health Verification
     ↓
Automatic Abort / Promotion
     ↓
Stable Application
```

---

# 29. Author

**Udeesha Jayendra**
