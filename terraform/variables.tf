variable "vpc_cidr" {
  description = "VPC CIDR range"
  type        = string
  default     = "10.0.0.0/16"
}

variable "vpc_cidr_public" {
  description = "VPC Subnet Public CIDR range"
  type        = string
  default     = "10.0.1.0/24"
}

variable "vpc_name" {
  description = "VPC Name"
  type        = string
  default     = "main"
}

variable "instance_type" {
  description = "Preferred default instance type"
  type        = string
  default     = "t3.small"
}


