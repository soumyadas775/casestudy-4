# casestudy-4
# AWS S3 Shared Storage with EC2 and Docker

This project provisions AWS infrastructure to provide shared storage via an S3 bucket across three AWS EC2 instances. Each EC2 instance is launched in a separate availability zone within the same VPC, has Docker installed, and mounts the S3 bucket as shared storage. The infrastructure is defined using Terraform (Infrastructure as Code).

## Case Study Overview

*Problem Statement:* A client requires provisioning an AWS S3 bucket to provide shared storage across three AWS EC2 instances. These EC2 instances must reside within the same VPC, with each instance in a separate availability zone. The solution ensures all three EC2 instances can mount the S3 bucket. Docker is installed on each EC2 instance.

*Duration:* 2 days

*Tech Stack:* AWS CloudFormation/Terraform (Terraform is used in this solution)

## Solution

The solution involves the following AWS resources:

* *VPC (Virtual Private Cloud):* A dedicated network space for the EC2 instances.
* *Subnets:* Three public subnets, each in a different Availability Zone within the VPC, to host the EC2 instances.
* *Internet Gateway:* To allow communication between the VPC and the internet.
* *Route Table:* To control network traffic within the VPC.
* *Security Group:* To define inbound and outbound rules for the EC2 instances, allowing necessary traffic (e.g., SSH, HTTP).
* *S3 Bucket:* The shared storage bucket.
* *IAM Role & Instance Profile:* An IAM role attached to the EC2 instances, granting them permissions to access the S3 bucket (e.g., s3:GetObject, s3:PutObject).
* *EC2 Instances:* Three EC2 instances, each in a separate availability zone, configured with:
    * *User Data:* 
        * Install Docker.
        * Install necessary tools for S3 mounting (e.g., s3fs-fuse).
        * Mount the S3 bucket.

## Prerequisites

Before deploying this infrastructure, ensure you have the following:

* *AWS CLI Configured:* Your AWS credentials (access key ID and secret access key) must be configured with appropriate permissions to create these resources.
* *Terraform Installed:* [Install Terraform](https://developer.hashicorp.com/terraform/downloads) on your local machine.


## Verification

1.  *Check Docker Installation:* On each EC2 instance, run:
    bash
    docker --version
    
    You should see the Docker version installed.

2.  *Verify S3 Mount:* On each EC2 instance, run:
    bash
    df -h
    
    Look for an entry showing your S3 bucket mounted (e.g., /mnt/s3-bucket).

3.  *Test Shared Storage:*
    
        


## Cleanup

To destroy all the AWS resources created by this Terraform configuration, run:


terraform destroy
