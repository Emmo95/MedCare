# MedCare - Architecture

## Overview

The MedCare Azure environment is designed as a hybrid cloud platform.

The goal is to provide a central Azure foundation for cloud workloads while maintaining secure connectivity with MedCare's existing on-premises infrastructure and healthcare locations.

MedCare operates across multiple locations in the Netherlands, including:

* Amsterdam
* Rotterdam
* The Hague
* Utrecht
* Groningen
* Arnhem
* Maastricht
* Additional regional locations in the future

The architecture is designed around:

* Centralized governance
* Secure identity
* Segmented networking
* Hybrid connectivity
* Private access to internal services
* Centralized monitoring
* Infrastructure as Code
* Support for multiple healthcare locations

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
                       +----------+----------+
                       |                     |
                       v                     v
                  Workload Spokes       Shared Services
                       |                     |
                       +----------+----------+
                                  |
                                  v
                              Hub VNet
                       +----------+----------+
                       |                     |
                       v                     v
                Network Services       Hybrid Connectivity
                                             |
                                             v
                                   On-Premises Environment
                                             |
                          +------------------+------------------+
                          |                  |                  |
                          v                  v                  v
                  Central Infrastructure   Networks       Healthcare Locations
                          |                                      |
                          |                    +-----------------+------------------+
                          |                    |        |        |        |        |
                          v                    v        v        v        v        v
                       Servers             Amsterdam Rotterdam The Hague Utrecht  Other Sites
                                              |
                                              +── Groningen
                                              +── Arnhem
                                              +── Maastricht
                                              +── Future Locations
```

The exact architecture will evolve as the platform is implemented and the detailed network and security requirements are defined.

The infrastructure supporting MedCare's communication systems is considered operationally important. These systems support the delivery of healthcare alarms and notifications to employees across MedCare locations.

The Azure platform does not directly replace these systems as part of the initial project. However, the wider architecture must provide the network reliability, availability, monitoring, and connectivity required to support the environment.

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

Spoke networks isolate workloads and services according to their security, connectivity, and operational requirements.

The final spoke structure will be defined during the detailed network design phase.

Possible workload boundaries may include:

```text
Hub
│
├── Application Workloads
│
├── Data Services
│
├── Management Services
│
└── Integration Services
```

Spokes should not communicate with each other directly unless there is a defined requirement.

Traffic between environments and workloads is controlled through centralized network security and routing.

---

## Hybrid Connectivity

The Azure environment must communicate with MedCare's existing on-premises infrastructure and healthcare locations.

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
Central On-Premises Network
  |
  +── Servers
  +── Active Directory
  +── Internal Applications
  +── Communication Infrastructure
  |
  +── Healthcare Locations
       |
       +── Amsterdam
       +── Rotterdam
       +── The Hague
       +── Utrecht
       +── Groningen
       +── Arnhem
       +── Maastricht
       +── Future Locations
```

The architecture should allow additional locations and connectivity options to be introduced later.

The detailed connectivity model, routing, IP addressing, DNS, and network segmentation will be defined in the network design documentation.

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

Workloads will be evaluated based on their technical requirements, security requirements, operational importance, and dependency on existing infrastructure.

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

Security requirements for the Azure platform and hybrid environment will be defined in the security design documentation.

---

## Monitoring Architecture

Monitoring is centralized to provide visibility across the Azure environment and, where possible, the wider hybrid infrastructure.

The platform will use Azure monitoring services to collect:

* Resource logs
* Activity logs
* Application telemetry
* Performance metrics
* Security events
* Network information

The goal is to provide a single operational view of the environment and make troubleshooting easier.

Monitoring should also provide visibility into important dependencies between Azure workloads and on-premises infrastructure.

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

The architecture follows these principles.

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

### Support Hybrid Operations

Azure and on-premises infrastructure should operate as part of one connected environment where required.

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
* [Network Design](04-network-design.md)
* [Security Design](05-security-design.md)
* [Identity & Access](06-identity-and-access.md)
* [Monitoring & Logging](07-monitoring-and-logging.md)
