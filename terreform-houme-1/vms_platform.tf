variable "vm_db_cidr" {
  type        = list(string)
  default     = ["10.0.2.0/24"]
  description = "https://cloud.yandex.ru/docs/vpc/operations/subnet-create"
}

variable "vpc_db_name" {
  type        = string
  default     = "develop-b"
  description = "VPC network & subnet name"
}

variable "vm_db_zone" {
  type        = string
  default     = "ru-central1-b"
  description = "https://cloud.yandex.ru/docs/overview/concepts/geo-scope"
}

variable "vm_db_ubuntu" {
  type        = string
  default     = "ubuntu-2204-lts"
  description = "famyli operating system"
}

variable "vm_db_name" {
  type        = string
  default     = "db"
  description = "name virtual machine"
}

variable "vm_db_hostname" {
  type        = string
  default     = "netology-develop-platform-db"
  description = "hostname virtual machine"
}


variable "vm_db_platform" {
  type        = string
  default     = "standard-v3"
  description = "platform virtual machine"
}

# variable "vm_db_cores" {
#   type        = number
#   default     = 2
#   description = "cores virtual machine"
# }

# variable "vm_db_memory" {
#   type        = number
#   default     = 2
#   description = "memory virtual machine"
# }

# variable "vm_db_core_fraction" {
#   type        = number
#   default     = 20
#   description = "core_fraction virtual machine"
# }

variable "vm_db_type" {
  type        = string
  default     = "network-hdd"
  description = "type disk virtual machine"
}

variable "vm_db_size" {
  type        = number
  default     = 10
  description = "size virtual machine"
}

variable "vm_db_preemptible" {
  type        = bool
  default     = true
  description = "preemptible virtual machine"
}

variable "vm_db_nat" {
  type        = bool
  default     = true
  description = "nat network interface virtual machine"
}

# variable "vm_db_port" {
#   type        = number
#   default     = 1
#   description = "serial-port-enable virtual machine"
# }

variable "vms_resources" {
  type = map(any)
  default = {
    web = {
      cores         = 2
      memory        = 2
      core_fraction = 20
    },
    db = {
      cores         = 2
      memory        = 1
      core_fraction = 20
    }
  }
   description = "default resources"
}


