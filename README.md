# 🐳 Installing Docker on a running Linux server in US-east-1 using terraform

containers vs Virtual machines (VM)

📚 Containers are more portable and more resource efficient compared to VM's. They also share the same Operating System OS kernel and you deploy multiple containers on one OS. Containers have all of the necessary dependencies and configurations encapsulated into one package for an application to function and perform across multiple environments. Since VM's have a single OS built inside them, they are larger and have slower performance, but provide stronger isolation. 

☁️ This project demonstrates how to use Terraform to provision a Linux EC2 instance on AWS and install Docker on it. The setup includes creating a VPC, subnets, security groups, and connecting to the server via SSH protocol on port 22.

