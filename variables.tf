variable "region" {
  default = "us-east-1"
}

variable "vpc_cidr" {
  default = "10.0.0.0/16"
}

variable "public_subnets" {
  type    = list(string)
  default = ["10.0.1.0/24", "10.0.2.0/24"]
}

variable "private_subnets" {
  type    = list(string)
  default = ["10.0.101.0/24", "10.0.102.0/24"]
}

variable "azs" {
  type    = list(string)
  default = ["us-east-1a", "us-east-1b"]
}

variable "ec2_key_name" {
  description = "Name of the EC2 key pair"
  default     = "VPC-test"
}

variable "ec2_instance_type" {
  default = "t2.micro"
}

variable "rds_username" {
  default = "admin"
}

variable "rds_password" {
  default = "Admin12345"
}

variable "rds_instance_class" {
  default = "db.t3.micro"
}

variable "rds_engine" {
  default = "mysql"
}

variable "rds_allocated_storage" {
  default = 20
}
