variable "token" {
  description = "Hetzner Cloud access token"
}

variable "ssh_key" {
  description = "Hetzner Cloud public ssh key for root access"
}

variable "master_instance_type" {
  description = "k8s master instance type"
  default = "cx11"
}

variable "worker_instance_type" {
  description = "k8s master instance type"
  default = "cx11"
}

variable "master_count" {
  description = "number of k8s masters to spawn"
  default = "1"
}

variable "worker_count" {
  description = "number of k8s workers to spawn"
  default = "2"
}


variable "name" {
  description = "k8s instances common name"
}

variable "image" {
  description = "Hetzner Cloud system image"
  default = "ubuntu-18.04"
}

variable "keep_disk" {
  description = "Hetzner Cloud allow downgrade of server"
  default = true
}

variable "cloud_init" {
  description = "Additional cloud init script"
  default = ""
}