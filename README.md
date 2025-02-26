**Redis Sentinel Deployment on AWS EKS**  

**Introduction**  
This project automates the deployment of **Redis Sentinel on AWS EKS** using **Terraform, kubectl, and GitHub Actions**. The infrastructure components, including **VPC, NAT Gateway, EKS, and security groups**, are provisioned via Terraform, while Redis and its supporting services are deployed using Kubernetes manifests.  

**What is Redis?**  
**Redis (Remote Dictionary Server)** is an open-source, in-memory data structure store that can be used as a **database, cache, and message broker**. It works by storing data in RAM for ultra-fast reads and writes, supporting **key-value pairs, lists, sets, and more**.  

**What is Redis Sentinel?**  
**Redis Sentinel** is a high-availability solution that monitors Redis instances, automatically **detecting failures and promoting a replica to master** when needed. It ensures **failover, monitoring, and configuration updates** in a Redis cluster.  


 **Code Workflow**  

1. **Provisioning Infrastructure with Terraform:**  
   - Deploys AWS components: **VPC, NAT Gateway, EKS, Node Group, Subnets, Security Groups**.  
   - Stores Terraform **state files in S3** for execution status tracking.  

2. **Deploying Redis on EKS with kubectl:**  
   - Applies Kubernetes YAML manifests using **kubectl**.  
   - Configures **Namespaces, StatefulSets, Horizontal Pod Autoscaler (HPA), StorageClass** for Redis.  

3. **CI/CD Automation via GitHub Actions:**  
   - **GitHub Actions** pipeline provisions infrastructure and deploys Redis on EKS.  
   - After the demo, **GitHub Actions automatically destroys** the infrastructure.  


 **Architecture Overview**  
Refer to the image URL for the **Redis & EKS architecture**:  https://github.com/Ashwin15397/DevopsRedisDeployProject/blob/main/UnzerProjectArchitectureDiagram.jpg




