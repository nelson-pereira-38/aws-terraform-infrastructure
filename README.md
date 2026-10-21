# AWS Infrastructure Automation with Terraform

## Project Overview

This project demonstrates Infrastructure as Code (IaC) using Terraform to define and manage AWS networking infrastructure.

The goal is to build a secure, organized, and reproducible AWS environment while developing hands-on cloud engineering and automation skills.

**Current Status:** Infrastructure configuration completed locally and validated with Terraform. AWS deployment is pending.

## Technologies Used

- Amazon Web Services (AWS)
- Terraform
- Amazon VPC
- AWS Internet Gateway
- AWS Route Tables
- Git and GitHub
- Visual Studio Code
- PowerShell

## Infrastructure Architecture

The Terraform configuration currently defines:

| Resource | Configuration |
|---|---|
| VPC | 10.0.0.0/16 |
| Public Subnet | 10.0.1.0/24 |
| Private Subnet | 10.0.2.0/24 |
| Internet Gateway | Attached to the VPC |
| Public Route Table | Default IPv4 route to Internet Gateway |
| Private Route Table | Local VPC routing only |
| Route Table Associations | Separate public and private subnet associations |

## Project Structure

```text
Project-1-Terraform/
├── main.tf
├── versions.tf
├── vpc.tf
├── subnets.tf
├── networking.tf
├── .terraform.lock.hcl
├── .gitignore
└── README.md
```

## Validation

The Terraform configuration has been successfully initialized, formatted, and validated using:

```powershell
terraform init
terraform fmt
terraform validate
```

## Security Considerations

- Public and private subnets use separate route tables.
- The private subnet has no direct route to the Internet Gateway.
- Terraform state files and sensitive local configuration files are excluded from Git.
- Security group configuration will be added in a future development stage.

## Planned Improvements

- Implement security groups with explicit inbound and outbound rules.
- Deploy EC2 instances.
- Configure secure administrative access.
- Add infrastructure outputs and reusable variables.
- Deploy and test the infrastructure in AWS.
- Document verification results and troubleshooting procedures.

## Learning Objectives

This project demonstrates practical experience with AWS networking, Terraform resource dependencies, infrastructure configuration, routing, version control, and cloud security fundamentals.
