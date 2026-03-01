variable "aws_region" {
  description = "AWS region"
  default     = "us-east-1"
}

variable "instance_type" {
  description = "Type of EC2 instance to provision"
  default     = "t3.small"
}

variable "ami_id" {
  description = "Ubuntu 22.04 LTS AMI ID for us-east-1"
  default     = "ami-0c7217cdde317cfec" # Update this to the latest Ubuntu AMI in your region
}

variable "key_name" {
  description = "Name of the SSH key pair in AWS"
  type        = string
}
