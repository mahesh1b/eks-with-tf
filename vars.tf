variable "project_name" {
  type = string
}

variable "instance_type" {
  type = string
}

variable "desired_size" {
  type = number
}

variable "min_node" {
  type = number
}

variable "max_node" {
  type = number
}

variable "max_unavailable" {
  type = number
}