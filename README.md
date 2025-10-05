# Terraform + Ansible AWS Infrastructure Automation

This project demonstrates how to **provision and configure AWS infrastructure automatically** using **Terraform** and **Ansible**.  
It’s part of my Cloud Engineering learning track (Week 2: *IaC + Networking + Shared Storage*).

---

##  Overview

The goal was to build a simple but production-like environment that includes:

- A **VPC** with both public and private subnets  
- An **Internet Gateway** and **Route Table** for external access  
- A **Security Group** allowing SSH and HTTP traffic  
- An **EC2 Instance** provisioned via Terraform  
- Configuration and package management handled through **Ansible**

---

## Tools & Technologies

| Tool | Purpose |
|------|----------|
| **Terraform** | Infrastructure provisioning (AWS VPC, Subnets, EC2, SGs) |
| **Ansible** | Server configuration and package management |
| **AWS** | Cloud provider (EC2, VPC, Networking) |
| **Linux** | Host environment for automation |
| **Git & GitHub** | Version control and documentation |

---

##  Architecture Diagram

This illustrates the workflow and components of the setup:

<img width="1145" height="655" alt="ted" src="https://github.com/user-attachments/assets/a4204c2c-1678-42dd-84c8-efb37467af3c" />

