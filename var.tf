/*variable "public_subnet_cidrs" {
  type        = list(string)
  description = "Public Subnet CIDR values"
  default     = ["10.0.1.0/24", "10.0.2.0/24"]
}*/

# host_os
variable "host_os" {
  type = string
  default = "windows"
  }


#ami definition type 2
variable "ami" {
  type = map

  default = {
    "us-east-1" = "ami-0574da719dca65348"
    "us-west-2a" = "ami-0574da719dca65348"
    "us-west-2a" = "ami-0574da719dca65348"
  }
}
variable "instance_count" {
  default = "2"
}

variable "instance_type" {
  default = "t2.nano"
}

variable "aws_region" {
  default = "us-west-2a"
}
