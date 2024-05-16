# Hello World Node.js App Deployment on AWS ECS/Fargate

This repository contains the code and configuration to deploy a simple Hello World Node.js application to AWS ECS (Elastic Container Service) using Fargate. The deployment process is automated using GitHub Actions for continuous deployment (CD).

## Prerequisites

Before getting started, ensure you have the following prerequisites set up:

- AWS account with appropriate permissions to create ECS resources.
- Docker installed locally for building and pushing container images.
- GitHub repository set up with the Node.js application code.

## Deployment Steps

### 1. AWS ECS/Fargate Configuration

1. Create an AWS ECS Cluster:
   - Update the `name` field in `main.tf` with your desired ECS cluster name.

2. Define an ECS Task Definition:
   - Update the `name`, `cpu`, `memory`, `image`, and `portMappings` fields in `main.tf` to match your application requirements.

3. Create an ECS Service:
   - Update the `name`, `cluster`, `task_definition`, `subnets`, and `security_groups` fields in `main.tf` to configure your ECS service.

### 2. GitHub Actions CD Pipeline

1. Set up AWS Credentials:
   - Configure your GitHub repository secrets (`AWS_ACCESS_KEY_ID`, `AWS_SECRET_ACCESS_KEY`) with appropriate AWS IAM credentials.

2. Configure Docker and Amazon ECR:
   - Update the Docker image tag and Amazon ECR repository details in `.github/workflows/deploy.yml`.

3. Deploy to ECS:
   - The GitHub Actions workflow (`deploy.yml`) automatically triggers on push to the `main` branch.
   - This workflow pulls the Docker image, tags it for Amazon ECR, and deploys it to the ECS service.

## Continuous Deployment (CD) Workflow

The CD workflow is managed using GitHub Actions. On each push to the `main` branch, the following steps occur:

1. The latest Docker image is pulled.
2. The image is tagged for the Amazon ECR repository.
3. The tagged image is pushed to Amazon ECR.
4. The ECS service is updated to deploy the new image, triggering a new deployment.

## Additional Notes

- **Networking**: Ensure your ECS service is configured with appropriate subnets and security groups to allow traffic to the deployed application.
- **Scaling**: Adjust the `cpu`, `memory`, and `desired_count` parameters in `main.tf` as per your application's scaling needs.
- **Customization**: Modify the ECS task definition and service configuration in `main.tf` to suit your specific application requirements.

Feel free to customize this deployment process based on your application's needs and deployment preferences. Happy deploying!
