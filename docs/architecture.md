# MedCare - Architecture

## Overview

The MedCare Azure environment is designed as a hybrid cloud platform.

The goal is to provide a central Azure foundation for cloud workloads while maintaining secure connectivity with MedCare's existing on-premises infrastructure.

The architecture is designed around:

* Centralized governance
* Secure identity
* Segmented networking
* Hybrid connectivity
* Private access to internal services
* Centralized monitoring
* Infrastructure as Code

The platform will use a hub-and-spoke network model to separate shared services from individual workloads.

---

## High-Level Architecture

```text
                         INTERNET
                             |
                             v
                    Public Applications
                             |
                             v
                    Azure Workloads
                             |
                             |
                  +----------+----------+
                  |                     |
                  v                     v
             Application              Data
               Spoke                  Spoke
                  |                     |
                  +----------+----------+
                             |
                             v
                         Hub VNet
                  +----------+----------+
                  |                     |
                  v                     v
            Shared Services       Hybrid Connectivity
                                        |
                                        v
                              On-Premises Environment
                                        |
                         +--------------+--------------+
                         |              |              |
                         v              v              v
                      Servers       Networks       Locations
```

The exact architecture will evolve as the platform is implemented.

---

## Azure Structure

The Azure environment will be organized to separate platform services from application workloads.

The intended structure is:

```text
Azure Tenant
│
├── Management
│
├── Platform
│   ├── Identity
│   ├── Connectivity
│   └── Management
│
└── Landing Zones
    ├── Development
    ├── Test
    └── Production
```

This separation provides clear boundaries for:

* Access
* Governance
* Security
* Networking
* Workloads
* Cost management

The exact subscription structure will be defined as part of the platform implementation.

---

## Network Architecture

The Azure network follows a hub-and-spoke design.

### Hub

The hub provides centralized services shared by multiple workloads.

These may include:

* Hybrid connectivity
* Network security
* DNS
* Shared management services
* Centralized routing

### Spokes

Spoke networks isolate workloads based on their function.

Examples include:

```text
Hub
│
├── Application Spoke
│
├── Data Spoke
│
├── Management Spoke
│
└── Integration Spoke
```

Spokes should not communicate with each other directly unless there is a defined requirement.

Traffic between environments and workloads is controlled through centralized network security and routing.

---

## Hybrid Connectivity

The Azure environment must communicate with MedCare's existing on-premises infrastructure.

The initial architecture will use secure VPN connectivity between Azure and the on-premises environment.

```text
Azure
  |
  v
VPN Gateway
  |
  | Encrypted Connection
  |
  v
On-Premises Network
  |
  +── Servers
  +── Active Directory
  +── Internal Applications
  +── Healthcare Locations
```

The architecture should allow additional locations and connectivity options to be introduced later.

---

## Identity Architecture

Microsoft Entra ID is the primary identity platform for Azure.

Identity and access will be managed centrally.

The architecture separates:

* User identities
* Administrative identities
* Application identities
* Managed identities

Access to Azure resources is controlled through RBAC.

Privileged access should be limited and protected with additional security controls.

---

## Workload Architecture

Workloads will be deployed according to their requirements.

The platform may contain a combination of:

* Azure App Services
* Azure Functions
* Virtual Machines
* Azure SQL
* Azure Storage
* Integration services

Where possible, managed Azure services will be preferred over managing infrastructure manually.

Workloads requiring traditional server infrastructure may remain on virtual machines or on-premises systems.

The architecture does not assume that every workload should be migrated to Azure.

---

## Security Architecture

Security is applied across multiple layers.

```text
Identity
   |
   v
Access Control
   |
   v
Network Security
   |
   v
Application Security
   |
   v
Data Protection
   |
   v
Monitoring
```

The platform will use appropriate Azure security services and controls to protect workloads and data.

Internal services should use private connectivity wherever practical.

Public access should only be introduced where required by the application or business.

---

## Monitoring Architecture

Monitoring is centralized to provide visibility across the Azure environment.

The platform will use Azure monitoring services to collect:

* Resource logs
* Activity logs
* Application telemetry
* Performance metrics
* Security events
* Network information

The goal is to provide a single operational view of the environment and make troubleshooting easier.

---

## Infrastructure as Code

The Azure platform will be deployed using Infrastructure as Code.

Bicep will be used to define Azure resources and infrastructure.

The deployment model will follow:

```text
Bicep
  |
  v
Validation
  |
  v
What-If
  |
  v
Deployment
  |
  v
Testing
```

Infrastructure changes will be stored in Git and deployed through controlled processes.

---

## Architecture Principles

The architecture follows these principles:

### Centralize Shared Services

Common platform services should be managed centrally where practical.

### Separate Workloads

Workloads should be isolated according to their security and operational requirements.

### Minimize Public Exposure

Services should remain private unless public access is required.

### Use Managed Services

Use Azure-managed services where they provide clear operational benefits.

### Automate Infrastructure

Infrastructure should be deployed consistently through code.

### Design for Growth

The platform should support additional workloads and locations without requiring a complete redesign.

### Keep It Understandable

The architecture should be secure and scalable without introducing unnecessary complexity.

---

## Architecture Direction

The MedCare platform will evolve from the initial foundation toward a complete hybrid cloud environment.

The expected progression is:

```text
Azure Foundation
       ↓
Identity & Governance
       ↓
Hub Network
       ↓
Hybrid Connectivity
       ↓
Workload Spokes
       ↓
Security Controls
       ↓
Monitoring
       ↓
Automation
       ↓
Production Workloads
```

Detailed designs for each area are maintained in separate documentation.

---

## Related Documentation

* [Project Overview](01-project-overview.md)
* [Requirements](02-requirements.md)
