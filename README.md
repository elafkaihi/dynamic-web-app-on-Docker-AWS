# Dynamic Web Application Deployment on AWS with Docker, Amazon ECR, and Amazon ECS

This project demonstrates the deployment of a dynamic web application on AWS using various DevOps tools and services. The application is containerized using Docker and deployed on Amazon ECS using Fargate. The infrastructure is designed for high availability and scalability, incorporating a three-tier VPC, auto-scaling groups, and load balancing. Below is a detailed description of the tools and services used in this project, along with the deployment architecture.

## Architecture 

![Alt text](/Architecture.jpg)

## Table of Contents
- [Tools and Services Used](#tools-and-services-used)
- [Architecture](#architecture)
- [Setup and Deployment](#setup-and-deployment)
- [Repository Structure](#repository-structure)


## Tools and Services Used

1. **Docker**: Used to build the container image for the web application.
2. **Git**: Used to track changes to source code and files.
3. **GitHub**: Manages the Dockerfile and application code in Git repositories.
4. **AWS CLI**: Interacts with AWS services from the command line.
5. **Flyway**: Migrates SQL data into the Amazon RDS database.
6. **VS Code**: Used for writing and editing scripts.
7. **Amazon ECR**: Stores the Docker image.
8. **Amazon ECS**: Containerizes the web application on the AWS cloud.
9. **3-Tier VPC**: Consists of public and private subnets in two availability zones for high availability.
10. **Internet Gateway**: Allows communication between VPC resources and the internet.
11. **NAT Gateways**: Allows resources in private subnets to access the internet.
12. **Amazon MySQL RDS**: Provides a relational database service.
13. **ECS Fargate**: Runs the containerized application.
14. **Application Load Balancer**: Distributes web traffic to ECS Fargate tasks.
15. **Auto Scaling Group**: Dynamically creates new ECS tasks based on demand.
16. **Route 53**: Registers domain names and creates DNS record sets.
17. **AWS S3**: Stores files containing environment variables for the container.
18. **IAM Role**: Grants permissions for ECS to execute tasks.
19. **Bastion Host**: Sets up an SSH tunnel for secure access.
20. **Security Group**: Controls inbound and outbound traffic to resources.
21. **Certificate Manager**: Encrypts data in transit.

## Architecture

The architecture of the deployment is as follows:

1. **VPC Configuration**:
    - A three-tier VPC with public and private subnets across two availability zones.
    - An Internet Gateway and NAT Gateways to manage internet traffic.

2. **Compute and Containerization**:
    - Docker is used to build the application image.
    - The image is stored in Amazon ECR.
    - Amazon ECS with Fargate runs the containerized application.

3. **Database**:
    - Amazon RDS with MySQL is used for the relational database.
    - Flyway handles database migrations.

4. **Networking and Security**:
    - An Application Load Balancer distributes incoming traffic.
    - Auto Scaling Groups manage the scaling of ECS tasks.
    - Route 53 handles DNS.
    - Security Groups and IAM Roles ensure secure access and permissions.
    - A Bastion Host provides secure SSH access.
    - AWS Certificate Manager manages SSL/TLS certificates.

5. **Storage**:
    - AWS S3 stores environment variable files and other necessary assets.

## Setup and Deployment

### Prerequisites

- AWS account with necessary permissions
- AWS CLI configured
- Docker installed
- Git installed
- Flyway installed

### Steps

1. **Clone the Repository**:
    ```bash
    git clone https://github.com/yourusername/dynamic-web-app-on-aws.git
    cd dynamic-web-app-on-aws
    ```

2. **Build and Push Docker Image**:
    ```bash
    docker build -t your-repo-name .
    aws ecr get-login-password --region your-region | docker login --username AWS --password-stdin your-account-id.dkr.ecr.your-region.amazonaws.com
    docker tag your-repo-name:latest your-account-id.dkr.ecr.your-region.amazonaws.com/your-repo-name:latest
    docker push your-account-id.dkr.ecr.your-region.amazonaws.com/your-repo-name:latest
    ```

3. **Deploy Infrastructure**:
    - Use AWS CloudFormation or Terraform scripts included in the repository to set up the VPC, subnets, gateways, ECS cluster, and other resources.

4. **Database Migration**:
    ```bash
    flyway -url=jdbc:mysql://your-rds-endpoint:3306/your-database -user=your-username -password=your-password migrate
    ```

5. **Deploy Application**:
    - Create an ECS task definition referencing the Docker image in ECR.
    - Set up the Application Load Balancer and configure listeners.
    - Register the ECS service with the load balancer.
    - Configure auto-scaling policies.

## Repository Structure

- `rentzone-docker/Dockerfile`: Dockerfile to build the application image.
- `rentzone.zip/`: Source code of the web application.
- `rentzone-docker/`: Deployment and setup scripts.
- `migrations/`: Flyway migration scripts.
- `README.md`: Project documentation.
