########
# Label
########
variable "name" {
  description = "The name for the label"
  type        = string
  default     = "prep"
}

variable "environment" {
  description = "The environment"
  type        = string
  default     = ""
}

variable "namespace" {
  description = "The namespace to deploy into"
  type        = string
  default     = "prod"
}

variable "vpc_type" {
  description = "The type of vpc"
  type        = string
  default     = "monitoring"
}

#####
# RDS
#####
variable "instance_class" {
  description = "instance class for DB"
  type        = string
  default     = "db.t3.small"
}

variable "security_group" {
  description = "The sg for rds"
  type        = string
}

variable "subnet_ids" {
  description = "The subnet ids for deployment"
  type        = list(string)
}

variable "username" {
  description = "Default username"
  type        = string
  default     = "icon"
}

variable "password" {
  description = "The password to default user"
  type        = string
  default     = "changemenow"
}