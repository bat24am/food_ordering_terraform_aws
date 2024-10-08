provider "aws" {
  region = "us-east-1"  # Change this to your desired region
}

# Create a Security Group to allow HTTP, HTTPS, and SSH
resource "aws_security_group" "bat24am_sg" {
  name = "bat24am_sg"

  # Allow HTTP access (port 80)
  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  # Allow HTTPS access (port 443)
  ingress {
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  # Allow SSH access (port 22)
  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

 # Outbound rules: Allow all outbound traffic
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"  # -1 means all protocols
    cidr_blocks = ["0.0.0.0/0"]
  }
}

# Create an EC2 instance
resource "aws_instance" "bat24am_app_server" {
  ami           = "ami-0fff1b9a61dec8a5f"  # Replace with your desired AMI ID
  instance_type = "t2.micro"
  
  # Associate the security group with the EC2 instance
  vpc_security_group_ids = [aws_security_group.bat24am_sg.id]
  
  tags = {
    Name = "bat24am_app_server"
  }
}

# Create an S3 bucket
resource "aws_s3_bucket" "bat24am_bkt" {
  bucket = "bat24am-test-bkt"  # Ensure this is unique

  tags = {
    Name = "Terraform State Bucket"
    Environment = "Test"
  }
}
