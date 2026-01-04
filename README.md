🚀 Terraform EC2 with Docker Automation (AWS)

This project demonstrates how to provision an AWS EC2 instance using Terraform, attach EBS storage, configure secure SSH access, and automatically install Docker using a user data shell script.

It is designed as a beginner-to-intermediate DevOps project and is suitable for resume and recruiter review.

🧱 Architecture Overview

Terraform – Infrastructure as Code (IaC)

AWS EC2 – Compute instance

Amazon EBS (gp3) – Root volume (40 GB)

Security Group – SSH access only (port 22)

User Data Script – Automates Docker installation

Amazon Linux AMI

📂 Project Structure
.
├── ec2.tf          # EC2 instance & security group
├── provider.tf     # AWS provider configuration
├── variable.tf     # Input variables
├── docker.sh       # User data script (Docker installation)
└── README.md       # Project documentation

⚙️ What This Project Does

✔ Creates an EC2 instance using Terraform
✔ Attaches a 40 GB gp3 root EBS volume
✔ Configures a security group allowing only SSH (22)
✔ Uses user_data to:

Resize disk

Install Docker

Enable & start Docker service

Add ec2-user to Docker group

🔐 Security Best Practices

❌ No open “allow all” ports

✅ Only port 22 (SSH) is allowed

🔒 Follows least privilege principle

⚠️ For production, restrict SSH access to your IP only instead of 0.0.0.0/0.


🛠 Prerequisites

Before you begin, make sure you have:

AWS account

IAM user with EC2 permissions

AWS CLI configured (aws configure)

Terraform installed (v1.x+)

SSH key pair available in AWS


🚀 How to Deploy
1️⃣ Clone the Repository
git clone https://github.com/your-username/terraform-ec2-docker.git
cd terraform-ec2-docker

2️⃣ Initialize Terraform
terraform init

3️⃣ Validate Configuration
terraform validate

4️⃣ Apply Terraform Plan
terraform apply


Type yes when prompted.

🔑 Connect to the EC2 Instance
ssh -i your-key.pem ec2-user@<PUBLIC_IP>

🐳 Verify Docker Installation
docker --version
systemctl status docker
docker ps

🧪 Sample Test
docker run hello-world

🧠 Learning Outcomes

By completing this project, you will understand:

Terraform resource lifecycle

EC2 + Security Group provisioning

EBS volume configuration

User data automation

Docker installation on AWS

Infrastructure security basics

📌 Improvements You Can Add

Restrict SSH to your IP

Add Elastic IP

Create Terraform modules

Install Docker Compose

Add Nginx container deployment

Use remote backend (S3 + DynamoDB)

CI/CD integration

👨‍💻 Author

Suresh
DevOps Enthusiast | AWS | Terraform | Docker

⭐ If You Like This Project

Give it a ⭐ on GitHub and feel free to fork & improve it!