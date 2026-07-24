# MedCare - Network Design

## Overview

MedCare operates a distributed healthcare environment across multiple locations in the Netherlands.

The network must provide secure and reliable connectivity between healthcare locations, the central on-premises infrastructure, and the Microsoft Azure environment.

The network design must support:

* Multiple healthcare locations
* Central on-premises infrastructure
* Azure cloud workloads
* Secure hybrid connectivity
* Internal applications and services
* Communication systems
* Future locations
* Controlled network access

The design should provide a reliable foundation without creating unnecessary complexity.

---

## MedCare Locations

The initial environment includes the following locations:

```text
Amsterdam
Rotterdam
The Hague
Utrecht
Groningen
Arnhem
Maastricht
```

Additional regional locations may be added in the future.

The network design must allow new locations to be connected without requiring major changes to the existing Azure architecture.

---

## High-Level Network

The initial network model is based on a central hybrid architecture.

```text
                         MICROSOFT AZURE
                                |
                                |
                           Hub VNet
                                |
                         VPN Connectivity
                                |
                                |
                    Central On-Premises Network
                                |
              +-----------------+-----------------+
              |                 |                 |
              v                 v                 v
          Amsterdam         Rotterdam        The Hague
              |                 |                 |
              +-----------------+-----------------+
                                |
                                v
                            Utrecht
                                |
                    +-----------+-----------+
                    |           |           |
                    v           v           v
                Groningen     Arnhem     Maastricht

                                |
                                v
                         Future Locations
```

The exact physical connectivity between locations will be defined based on the existing MedCare network.

The Azure platform will connect to the central MedCare network rather than creating a separate direct VPN connection for every healthcare location.

---

## Azure Network

The Azure environment will use a hub-and-spoke network architecture.

```text
Azure
│
└── Hub VNet
    │
    ├── Connectivity
    │
    ├── Network Security
    │
    ├── DNS
    │
    └── Shared Services
         │
         ├── Application Workloads
         ├── Data Services
         ├── Management Services
         └── Integration Services
```

The hub provides centralized network services.

Workloads are deployed into separate spoke networks based on their requirements.

The exact number of spoke networks will be determined as workloads are introduced.

---

## Addressing

Azure and on-premises networks must use non-overlapping IP address ranges.

The address space will be planned before deploying the Azure network.

The initial design will separate:

* Azure address spaces
* On-premises address spaces
* Healthcare location networks
* Management networks
* Workload networks

The final IP addressing plan will be documented before production deployment.

Example:

```text
MedCare Network
│
├── Azure
│   ├── Hub
│   ├── Application Spokes
│   └── Other Workload Spokes
│
├── Central On-Premises
│
├── Amsterdam
├── Rotterdam
├── The Hague
├── Utrecht
├── Groningen
├── Arnhem
└── Maastricht
```

IP ranges must be allocated in a way that allows future locations and workloads to be added.

---

## Hybrid Connectivity

Azure will connect to the MedCare on-premises environment through secure VPN connectivity.

The initial design is:

```text
Azure
  |
  v
Azure VPN Gateway
  |
  | Encrypted VPN Connection
  |
  v
On-Premises VPN Device
  |
  v
Central MedCare Network
  |
  +── Healthcare Locations
  +── Internal Servers
  +── Active Directory
  +── Internal Applications
  +── Communication Infrastructure
```

The VPN connection provides private connectivity between Azure and the MedCare network.

The design should allow the connectivity solution to be upgraded in the future if higher bandwidth, redundancy, or additional connectivity options are required.

---

## Network Segmentation

The network will be segmented to limit unnecessary communication between systems.

Segmentation will be applied at multiple levels.

```text
Internet
   |
   v
Azure Hub
   |
   +── Shared Services
   |
   +── Application Workloads
   |
   +── Data Services
   |
   +── Management
   |
   v
On-Premises Network
   |
   +── Servers
   +── Healthcare Locations
   +── Communication Systems
```

Access between network segments should only be allowed when there is a defined business or technical requirement.

Network Security Groups and other Azure network security controls will be used where appropriate.

---

## Traffic Flow

Traffic between Azure and on-premises systems should follow controlled routes.

Example:

```text
Azure Workload
      |
      v
Azure Spoke
      |
      v
Hub VNet
      |
      v
VPN Gateway
      |
      v
MedCare Network
      |
      v
On-Premises Service
```

Traffic from on-premises systems to Azure follows the reverse path.

Direct communication between workload spokes should not be allowed unless explicitly required.

Internet-bound traffic will be controlled according to the security architecture.

---

## DNS

DNS must support name resolution across the hybrid environment.

Azure workloads may need to resolve:

* Azure resources
* On-premises services
* Internal applications
* Active Directory services
* Healthcare location services

The final DNS architecture will be defined during the implementation of the hybrid network.

The design should provide consistent name resolution between Azure and on-premises environments.

---

## Network Security

Network security will be implemented using multiple layers.

These may include:

* Network Security Groups
* Azure Firewall
* VPN security
* Route control
* Private endpoints
* Network segmentation
* Access control

The exact services used will depend on the final network architecture and security requirements.

The network should follow a default-deny approach where practical, allowing only required traffic.

---

## Availability

The network supports operationally important healthcare services and communication systems.

Network availability is therefore an important requirement.

The design should consider:

* Redundant connectivity
* VPN availability
* Azure service availability
* Network monitoring
* Failure detection
* Recovery procedures

The initial implementation may use a single connectivity path for development and testing.

Production connectivity should be reviewed for redundancy before critical workloads are migrated.

---

## Future Locations

New MedCare locations should be able to connect to the existing network without requiring a redesign of the Azure platform.

The intended model is:

```text
                    Azure Hub
                        |
                        |
                Central Connectivity
                        |
             +----------+----------+
             |          |          |
             v          v          v
          Existing   Existing   Existing
          Locations  Locations  Locations
                                    |
                                    v
                             New Location
```

The process for onboarding a new location should include:

1. Allocate a non-overlapping IP range.
2. Configure the local network.
3. Establish secure connectivity.
4. Configure routing.
5. Configure DNS where required.
6. Apply security controls.
7. Test connectivity.
8. Add monitoring.

---

## Network Design Principles

### Keep Networks Segmented

Systems should only communicate when communication is required.

### Avoid IP Overlap

Azure, on-premises, and healthcare locations must use unique address spaces.

### Centralize Connectivity

Azure connectivity should be managed centrally where practical.

### Minimize Public Exposure

Internal services should use private connectivity whenever possible.

### Design for Growth

The network must support additional locations and workloads.

### Monitor the Network

Connectivity and network health must be visible to the IT team.

### Keep the Design Understandable

The network should be secure and reliable without unnecessary complexity.

---

## Network Implementation Direction

The network will be implemented in stages.

```text
IP Address Plan
       ↓
Azure Hub VNet
       ↓
Subnets
       ↓
Network Security
       ↓
VPN Connectivity
       ↓
On-Premises Routing
       ↓
DNS
       ↓
Workload Spokes
       ↓
Testing
       ↓
Production Connectivity
```

The detailed IP addressing plan and subnet structure will be defined before the Azure network is deployed.

---

## Related Documentation

* [Project Overview](01-project-overview.md)
* [Requirements](02-requirements.md)
* [Architecture](03-architecture.md)
* [Security Design](05-security-design.md)
* [Identity & Access](06-identity-and-access.md)
* [Monitoring & Logging](07-monitoring-and-logging.md)
