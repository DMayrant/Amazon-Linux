variable "private_subnet_count" {
  type    = number
  default = 6

}

variable "public_subnet_count" {
  type    = number
  default = 6

}

variable "availability_zones" {
  type    = list(string)
  default = ["us-east-1a", "us-east-1b", "us-east-1c", "us-east-1d", "us-east-1e", "us-east-1f"]

}

variable "public_subnet_cidrs" {
  description = "CIDR blocks for public subnets"
  type        = list(string)
  default = [
    "10.54.10.0/24",
    "10.54.20.0/24",
    "10.54.30.0/24",
    "10.54.40.0/24",
    "10.54.50.0/24",
    "10.54.60.0/24"
  ]
}

variable "private_subnet_cidrs" {
  description = "CIDR blocks for private subnets"
  type        = list(string)
  default = [
    "10.54.100.0/24",
    "10.54.110.0/24",
    "10.54.120.0/24",
    "10.54.130.0/24",
    "10.54.140.0/24",
    "10.54.150.0/24"
  ]
}

variable "ec2_instance_type" {
  type        = string
  default     = "t3.micro"
  description = "Running EC2 instance"

}
variable "ec2_volume_config" {
  type = object({
    size = number
    type = string
  })
  default = {
    size = 10
    type = "gp3"
  }
}
