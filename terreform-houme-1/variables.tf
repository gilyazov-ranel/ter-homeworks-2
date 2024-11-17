###cloud vars


variable "cloud_id" {
  type        = string
  description = "https://cloud.yandex.ru/docs/resource-manager/operations/cloud/get-id"
  default = "b1gd15jq7t44kq6p0cpa"
}

variable "folder_id" {
  type        = string
  description = "https://cloud.yandex.ru/docs/resource-manager/operations/folder/get-id"
  default = "b1gab92rlq649vcj3feo"
}

variable "default_zone" {
  type        = string
  default     = "ru-central1-a"
  description = "https://cloud.yandex.ru/docs/overview/concepts/geo-scope"
}
variable "default_cidr" {
  type        = list(string)
  default     = ["10.0.1.0/24"]
  description = "https://cloud.yandex.ru/docs/vpc/operations/subnet-create"
}

variable "vpc_name" {
  type        = string
  default     = "develop"
  description = "VPC network & subnet name"
}

###ssh vars

# variable "vms_ssh_root_key" {
#   type        = string
#   default     = "ubuntu:ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIJKrfIvDPc0srFKuq4hSS1trpMfM7o/OpAvsbAm/BEx3 media-tel@mt-work-pc"
#   description = "ssh-keygen -t ed25519"
# }

variable "default_metadata" {
  type = map(any)
  default = {
    serial-port-enable = 1
    ssh-keys  = "ubuntu:ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIJKrfIvDPc0srFKuq4hSS1trpMfM7o/OpAvsbAm/BEx3 media-tel@mt-work-pc"
  }
  description = "default metadate"
}

variable "vm_web_zone" {
  type        = string
  default     = "ru-central1-a"
  description = "https://cloud.yandex.ru/docs/overview/concepts/geo-scope"
}

variable "vm_web_ubuntu" {
  type        = string
  default     = "ubuntu-2204-lts"
  description = "famyli operating system"
}

variable "vm_web_name" {
  type        = string
  default     = "web"
  description = "name virtual machine"
}

variable "vm_web_hostname" {
  type        = string
  default     = "netology-develop-platform-web-a"
  description = "hostname virtual machine"
}

variable "vm_web_platform" {
  type        = string
  default     = "standard-v3"
  description = "platform virtual machine"
}

# variable "vm_web_cores" {
#   type        = number
#   default     = 2
#   description = "cores virtual machine"
# }

# variable "vm_web_memory" {
#   type        = number
#   default     = 1
#   description = "memory virtual machine"
# }

# variable "vm_web_core_fraction" {
#   type        = number
#   default     = 20
#   description = "core_fraction virtual machine"
# }

variable "vm_web_type" {
  type        = string
  default     = "network-hdd"
  description = "type disk virtual machine"
}

variable "vm_web_size" {
  type        = number
  default     = 10
  description = "size virtual machine"
}

variable "vm_web_preemptible" {
  type        = bool
  default     = true
  description = "preemptible virtual machine"
}

variable "vm_web_nat" {
  type        = bool
  default     = true
  description = "nat network interface virtual machine"
}

# variable "vm_web_port" {
#   type        = number
#   default     = 1
#   description = "serial-port-enable virtual machine"
# }