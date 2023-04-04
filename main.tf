#VPC Creation
resource "aws_vpc" "ntc_vpc" {
  cidr_block           = "10.123.0.0/16"
  enable_dns_hostnames = true
  enable_dns_support   = true

  tags = {
    Name = "dev"
  }

}

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

#Internet GW IGW Creation
resource "aws_internet_gateway" "ntc_internet_gateway" {
  vpc_id = aws_vpc.ntc_vpc.id

  tags = {
    Name = "ntc_igw"
  }
}

#Route Table Creation
resource "aws_route_table" "ntc_public_rt" {
  vpc_id = aws_vpc.ntc_vpc.id

  tags = {
    Name = "dev_public_rt"
  }
}

#Route Inside a Route Table
resource "aws_route" "default_route" {
  route_table_id         = aws_route_table.ntc_public_rt.id
  destination_cidr_block = "0.0.0.0/0"
  gateway_id             = aws_internet_gateway.ntc_internet_gateway.id
}

#Route Table Assosisation with Subnet
resource "aws_route_table_association" "ntc_public_assoc" {
  subnet_id      = aws_subnet.ntc_public_subnet.id
  route_table_id = aws_route_table.ntc_public_rt.id
}

#Security Group
resource "aws_security_group" "ntc_sg" {
  name        = "public_sg"
  description = "public security group"
  vpc_id      = aws_vpc.ntc_vpc.id
  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

#Key Pair Generation
resource "aws_key_pair" "ntc_auth" {
  key_name   = "ntckey"
  public_key = file("~/.ssh/mtckey.pub")
}

# Instance Creation
resource "aws_instance" "dev_node" {
    instance_type = "t2.micro"
    /*ami   = "var.ami"*/  # Deploy with variable
    ami = data.aws_ami.server_ami.id
    key_name = aws_key_pair.ntc_auth.id 
    vpc_security_group_ids = [aws_security_group.ntc_sg.id]
    subnet_id = aws_subnet.ntc_public_subnet.id
    user_data = file("userdata.tpl")

    root_block_device {
        volume_size = 10
    }
    
    tags = {
        Name = "dev-node"
    }

# To push a content in series to a file present in the local system where the code is being written and executed
  provisioner "local-exec" {
    command = templatefile("${var.host_os}-ssh-config.tpl", {
      hostname = self.public_ip,
      user     = "ubuntu",
    identityfile = "~/.ssh/ntckey" })
    #interpreter == var.host_os == value?     [True]                     : [flase]
     interpreter = var.host_os == "windows" ? ["Powershell", "-Command"] : ["bash", "-c"]
  }
}
