# Build a Dev Environment with Terraform and AWS

![Architecture](https://github.com/ArcProjects/terraformaws-deploy/blob/docwriter/images/architecute.png)

In the peoject i will be using Terraform to create various resource such as Vpc, Subnet, Route table , Security group and EC2 instance.


Note  | 
:---:
 **Click on the blue highlighed text to know more information in each section.** |

- - -

## Steps

[1. IAM Setup](#1-iam-setup)

[2. Environment Setup](#2-environment-setup)

[3. Install Terraform](#3-install-terraform)

[4. AWS Provider & Authentication](#4-aws-provider--authentication)

[5. VPC Creation](#5-vpc-creation)

[6. Subnet Creation](#6-subnet-creation)

[7. Security Group Creation](#7-security-group-creation)

[8. Ami Datasource Configuration](#8-ami-datasource-configuration)

[9. key Pair Creation](#9-key-pair-creation)

[10. Ec2 Instance Creation](#10-ec2-instance-creation)

[11. User Data](#11-user-data)

[12. SSH Configuration](#12-ssh-configuration)
- - - - -
- - -----

### 1. IAM Setup
* Login to Aws Console - https://My_AWS_Account_ID.signin.aws.amazon.com/console/
* [create a user](https://docs.aws.amazon.com/IAM/latest/UserGuide/id_users_create.html) with admin privilages
* [Create new access keys](https://docs.aws.amazon.com/IAM/latest/UserGuide/id_credentials_access-keys.html) and download .csv file

### 2. Environment Setup

* [Install vscode](https://My_AWS_Account_ID.signin.aws.amazon.com/console/)
* Install Terraform, Aws Toolkit , Remote SSH Plugins.

![terraform](https://github.com/ArcProjects/terraformaws-deploy/blob/docwriter/images/vsterra.png)
![aws toolkit](https://github.com/ArcProjects/terraformaws-deploy/blob/docwriter/images/awstoolkit.png)
![Remote-SSH Plugins](https://github.com/ArcProjects/terraformaws-deploy/blob/docwriter/images/ssh%20plugins.png)



### 3. Install Terraform

* [Download and install Terraform](https://developer.hashicorp.com/terraform/tutorials/aws-get-started/install-cli)
* Create a terraform directory and initialise terraform using **terraform init** command 
![init](https://github.com/ArcProjects/terraformaws-deploy/blob/docwriter/images/init.png)

### 4. AWS Provider & Authentication

* [Create a file provider.tf  and add the provider](https://developer.hashicorp.com/terraform/tutorials/aws-get-started/install-cli)

```
terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 3.0"
    }
  }
}
```
* For authentication we can use many methods -more information follow the [link](https://registry.terraform.io/providers/hashicorp/aws/latest/docs). In this project i will be using the shared credential file. 
  * Parameters in the provider configuration
  * Environment variables
  * Shared credentials files
```
#authentication in provider.tf using shared credntial file
provider "aws" {
  region                  = "us-east-1"
  shared_credentials_file = "~/.aws/credentials"
  profile                 = "sim"
} 
```
  * Shared configuration files
  * Container credentials
  * Instance profile credentials and region

You can configure the credentials directly by going in to .aws folder and edit Shared configuration files put your acess keys , secrets and profile name or use vscode to create the credential profile

![aws folder](https://github.com/ArcProjects/terraformaws-deploy/blob/docwriter/images/awsfolder.png)

![vs code cred manager](https://github.com/ArcProjects/terraformaws-deploy/blob/docwriter/images/createcred.png)


### 5. VPC Creation
```
#VPC Creation in main.tf file
resource "aws_vpc" "ntc_vpc" {
  cidr_block           = "10.123.0.0/16"
  enable_dns_hostnames = true
  enable_dns_support   = true

  tags = {
    Name = "dev"
  }

}
```

### 6. Subnet Creation
```
#Subnet Creation
resource "aws_subnet" "ntc_public_subnet" {
  vpc_id                  = aws_vpc.ntc_vpc.id
  cidr_block              = "10.123.1.0/24"
  map_public_ip_on_launch = true
  availability_zone       = "us-east-1a"

  tags = {
    Name = "dev-public"
  }
}
```

### 7. Security Group Creation

### 8. Ami Datasource Configuration

### 9. key Pair Creation

### 10. Ec2 Instance Creation
### 11. User Data 

### 12. SSH Configuration
