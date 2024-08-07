variable "instance_name" {
  description = "EC2 name"
  type        = string
  default     = "Change Me"
}

variable "security_group_name" {
  description = "SG name"
  type        = string
  default     = "Change Me"
}

variable "instance_type" {
  description = "instance type"
  type        = string
  default     = "t2.micro"
}

variable "disk_size" {
  description = "disk size"
  type        = number
  default     = 8
}

variable "disk_type" {
  description = "disk type"
  type        = string
  default     = "io1"
}

variable "ami" {
  description = "AMI"
  type        = string
  default     = ""
}

variable "key_name" {
  description = "SSH pair"
  type        = string
}

variable "ingress_rules" {
  description = "ingress rules for SG"
  type = list(object({
    from_port   = number
    to_port     = number
    protocol    = string
    description = string
    cidr_blocks = string
  }))
  default = [
    {
      from_port   = 22
      to_port     = 22
      protocol    = "tcp"
      description = "SSH"
      cidr_blocks = "0.0.0.0/0"
    },
    {
      from_port   = 80
      to_port     = 80
      protocol    = "tcp"
      description = "HTTP"
      cidr_blocks = "0.0.0.0/0"
    }
  ]
}