# Build a Dev Environment with Terraform and AWS

![Architecture](https://github.com/ArcProjects/terraformaws-deploy/blob/docwriter/images/architecute.png)

In the peoject i will be using Terraform to create various resource such as Vpc, Subnet, Route table , Security group and EC2 instance.

Note  | 
:---:
 **Click on the blue highlighed text to know more information in each section.** |

- - -

## Steps

[1. IAM Setup](###IAM-Setup)

[2. Environment Setup](# Environment-Setup)

[3. Install Terraform](#Install-Terraform)

[4. AWS Provider & Authentication](#AWS-Provider-&-Authentication)

[5. VPC Creation](#VPC-Creation)

[6. Subnet Creation](#Subnet-Creation)

[7. Security Group Creation](#Security-Group-Creation)

[8. Ami Datasource Configuration](#Ami-Datasource-Configuration)

[9. key Pair Creation](#key-Pair-Creation)

[10. Ec2 Instance Creation](#Ec2-Instance-Creation)

[11. User Data](#User-Data)

[12. SSH Configuration](#SSH-Configuration)
- - - - -
- - -

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
* For authentication we can use many methods -more information follow the [link](https://registry.terraform.io/providers/hashicorp/aws/latest/docs). In this project i will be using the shared credential file. 
  * Parameters in the provider configuration
  * Environment variables
  * Shared credentials files
  * Shared configuration files
  * Container credentials
  * Instance profile credentials and region

You can configure the credentials directly by going in to .aws folder and edit Shared configuration files put your acess keys , secrets and profile name or use vscode to create the credential profile

![aws folder](https://github.com/ArcProjects/terraformaws-deploy/blob/docwriter/images/awsfolder.png)

![vs code cred manager](https://github.com/ArcProjects/terraformaws-deploy/blob/docwriter/images/createcred.png)


  


### 5. VPC Creation

### 6. Subnet Creation

### 7. Security Group Creation

### 8. Ami Datasource Configuration

### 9. key Pair Creation

### 10. Ec2 Instance Creation
### 11. User Data 

### 12. SSH Configuration
