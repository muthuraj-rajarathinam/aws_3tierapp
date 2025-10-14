# 🚀 3-Tier Auto-Deployed Web App on AWS — Fully Automated with Terraform & CodePipeline

> **A production-grade, CI/CD-powered 3-Tier Application built from scratch using AWS & DevOps tools — fully deployed with one commit.**
> Built an end-to-end 3-Tier Application with automated infrastructure provisioning and CI/CD pipeline on AWS. Implemented Terraform for IaC, Docker for containerization, and AWS CodePipeline for continuous delivery, ensuring each GitHub commit triggers a complete, hands-free deployment of frontend, backend, and database services.
---

## 🧠 Project Overview

This project demonstrates how to **design, provision, and automate the deployment** of a complete 3-tier web application using modern DevOps practices.

With a single `git push`, the entire pipeline triggers:

* **Infrastructure provisioning** via Terraform
* **Application build & containerization** via Docker
* **Deployment** across a **frontend**, **backend**, and **database** tier
* **Load balancing**, **auto-scaling**, and **secure networking** handled automatically by AWS

This showcases **end-to-end automation** — from infrastructure to application — without manual intervention.

---

## 💡 Key Highlights

| Category                         | Technologies & Tools                                            |
| -------------------------------- | --------------------------------------------------------------- |
| **Infrastructure as Code (IaC)** | Terraform                                                       |
| **Cloud Platform**               | AWS (EC2, RDS, ALB, VPC, IAM, S3, CodePipeline, CodeBuild)      |
| **Automation / CI-CD**           | AWS CodePipeline + CodeBuild                                    |
| **Containers**                   | Docker                                                          |
| **Frontend**                     | HTML, CSS, JavaScript                                           |
| **Backend**                      | Python Flask                                                    |
| **Database**                     | MySQL (Amazon RDS)                                              |
| **Networking**                   | VPC with Public + Private Subnets, Security Groups, NAT Gateway |
| **Monitoring**                   | AWS CloudWatch                                                  |
| **Version Control**              | GitHub                                                          |

---

## 🏗️ Architecture

**3-Tier Architecture Breakdown**

1. **Frontend Tier (Public Subnet)**

   * Deployed as a Docker container exposed on port `80`
   * Served behind an **Application Load Balancer (ALB)**
   * Displays product catalog & communicates with backend API

2. **Backend Tier (Private Subnet)**

   * Python Flask app running inside Docker on port `8080`
   * Communicates with RDS over private network
   * Exposes REST APIs (`/api/products`, `/api/checkout`)

3. **Database Tier (Private Subnet)**

   * **Amazon RDS (MySQL)** securely connected to backend
   * Stores products, orders, and transactions

4. **CI/CD Layer (AWS CodePipeline)**

   * Detects every commit in GitHub
   * Triggers **CodeBuild** to build Docker images
   * Pushes updates to EC2 via **Terraform-provisioned infrastructure**

---

## ⚙️ End-to-End Automation Flow

1. **Terraform applies infrastructure**:

   * Creates **VPC**, **subnets**, **security groups**, **RDS**, **ALB**, and **EC2**.
2. **User Data bootstraps EC2**:

   * Installs Docker, Git, clones the app repo, builds and runs containers.
3. **Docker containers** spin up automatically:

   * Backend Flask API → port `8080`
   * Frontend static app → port `80`
4. **Load Balancer** routes traffic to the frontend.
5. **Auto Scaling Group** Makes Instance Balance during traffic hike.
6. **Flask app** interacts securely with RDS MySQL in a private subnet.
7. **CodePipeline + CodeBuild** automate future updates:

   * Any code change in GitHub triggers new build + deployment automatically.

---

## 📁 Repository Structure

```
3tierapp_aws/
├── backend/
│   ├── app.py
│   ├── Dockerfile
│   ├── requirements.txt

├── frontend/
│   ├── index.html
│   ├── Dockerfile

├── terraform/
│   ├── main.tf
│   ├── variables.tf
│   ├── outputs.tf
│   ├── compute.tf
│   ├── database.tf
│   ├── versions.tf
│   ├── provider.tf
│   ├── security.tf

├── Scripts/
│   ├── user_data.sh
│   ├── Codebuild.yml

└── Docker-compose.yml    
└── README.md

```

---

## 🧩 Backend (Flask API)

* Handles product listing, checkout, and order creation.
* Automatically initializes database + tables on first startup.
* Connects to RDS using env variables injected by Terraform.

---

## 🖥️ Frontend (HTML + JS)

* Clean, minimal, responsive UI.
* Fetches product list dynamically from backend `/api/products`.
* Built to demonstrate API communication + frontend integration.

---

## ☁️ Terraform Highlights

* **Modular & reusable** architecture.
* Automatically exports RDS credentials into EC2 user data.
* Integrates IAM roles for CodePipeline and S3 artifact storage.
* Outputs ALB DNS name for instant access to frontend.

**Example Apply:**

```bash
terraform init
terraform apply -auto-approve
```

---

## 🛠️ CI/CD (CodePipeline Integration)

* **Source Stage:** GitHub repo connected via webhook.
* **Build Stage:** CodeBuild compiles and packages the app.
* **Deploy Stage:** Automatically updates the EC2 environment.

Each push to `main` branch triggers a full rebuild + redeploy.

---

## 🔐 Security & Networking

* Backend + DB run in **private subnets**, isolated from the internet.
* Frontend runs in **public subnet** via **ALB**.
* **NAT Gateway** enables backend access for updates.
* RDS accessible only from backend EC2 SG.
* Encrypted storage + IAM least privilege policies.

---

## 📈 Skills Demonstrated

✅ **Terraform (IaC)** – automated multi-tier infrastructure
✅ **AWS Cloud Architecture** – secure, scalable VPC design
✅ **Docker** – app containerization for portability
✅ **CI/CD (CodePipeline)** – end-to-end automation from GitHub
✅ **Flask + MySQL** – backend API design and DB integration
✅ **Load Balancing & Health Checks** – ALB integration with private targets
✅ **Debugging & Observability** – log monitoring, DNS/network diagnostics

---

---

## ✨ Author

**👨‍💻 Muthuraj Rajarathinam**
DevOps Engineer | AWS | Terraform | Docker | CI/CD | Cloud Architecture
🔗 [GitHub](https://github.com/muthuraj-rajarathinam) • [LinkedIn](https://www.linkedin.com/in/muthuraj-rajarathinam)

---

## 🧭 Final Words

> “This project represents my ability to build, automate, and deploy production-grade systems on AWS — bridging the gap between development and cloud operations with real-world DevOps skills.”


