# About MedCare

MedCare is a healthcare organization operating across multiple locations in the Netherlands.

Its IT environment supports healthcare professionals, administrative employees, connected healthcare devices, internal applications, and remote locations.

The organization currently operates a hybrid IT environment with on-premises infrastructure and a growing number of cloud services.

Current Situation

MedCare's infrastructure has grown over time.

The current environment includes:

On-premises servers and virtualization
Windows-based infrastructure
Active Directory
Internal applications and file services
Network infrastructure across multiple locations
Connected healthcare and IoT devices
Remote maintenance systems
Existing Microsoft Azure resources

Some systems are still fully dependent on the on-premises environment, while others are already moving toward cloud-based services.

The current environment works, but management, security, monitoring, and deployment are not yet standardized across the entire organization.

The Project

The goal of this project is to design and build a modern Azure-based platform that integrates with MedCare's existing infrastructure.

The platform should provide a solid foundation for:

Secure identity and access
Hybrid connectivity
Cloud workloads
Infrastructure automation
Centralized monitoring
Security and governance
Backup and disaster recovery
Future expansion

Not every workload needs to move to Azure.

The goal is to determine which systems should remain on-premises, which should move to Azure, and which should be replaced or modernized.

Project Approach

The environment will be developed in stages:

Business Context
      ↓
Requirements
      ↓
Architecture
      ↓
Infrastructure
      ↓
Security
      ↓
Deployment
      ↓
Monitoring
      ↓
Operations
      ↓
Continuous Improvement

Each stage builds on the previous one.

Infrastructure will be defined as code where possible and managed through version control.

Project Goal

The final result should be a realistic hybrid healthcare environment that can be securely operated and maintained by an IT engineering team.

The platform should be:

Secure
Reliable
Observable
Automated
Maintainable
Recoverable
Scalable

The project will continue to evolve as new requirements, workloads, and operational scenarios are introduced.

Platform: Microsoft Azure
Infrastructure as Code: Bicep
Automation: PowerShell / Azure CLI
Source Control: GitHub
Status: Active Development
