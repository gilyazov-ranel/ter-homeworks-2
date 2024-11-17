resource "yandex_vpc_network" "develop" {
  name = var.vpc_name
}

resource "yandex_vpc_subnet" "develop-a" {
  name           = var.vpc_name
  zone           = var.default_zone
  network_id     = yandex_vpc_network.develop.id
  v4_cidr_blocks = var.default_cidr
}

resource "yandex_vpc_subnet" "develop-b" {
  name           = var.vpc_db_name
  zone           = var.vm_db_zone
  network_id     = yandex_vpc_network.develop.id
  v4_cidr_blocks = var.vm_db_cidr
}

data "yandex_compute_image" "ubuntu" {
  family = var.vm_web_ubuntu
}

resource "yandex_compute_instance" "platform-a" {
  name        = "${local.name_local}${var.vm_web_name}"
  allow_stopping_for_update = true
  hostname    = var.vm_web_hostname
  platform_id = var.vm_web_platform
  zone        = var.vm_web_zone

  resources {
    cores         = var.vms_resources.web.cores
    memory        = var.vms_resources.web.memory
    core_fraction = var.vms_resources.web.core_fraction
  }

  boot_disk {
    initialize_params {
      image_id = data.yandex_compute_image.ubuntu.image_id
      type     = var.vm_web_type
      size     = var.vm_web_size
    }
  }

  scheduling_policy {
    preemptible = var.vm_web_preemptible
  }

  network_interface {
    subnet_id = yandex_vpc_subnet.develop-a.id
    nat       = var.vm_web_nat
  }

  metadata                  = var.default_metadata
  
}

resource "yandex_compute_instance" "platform-b" {
  name        = "${local.name_local}${var.vm_db_name}"
  allow_stopping_for_update = true
  hostname    = var.vm_db_hostname
  platform_id = var.vm_db_platform
  zone        = var.vm_db_zone
  

  resources {
    cores         = var.vms_resources.db.cores
    memory        = var.vms_resources.db.memory
    core_fraction = var.vms_resources.db.core_fraction
  }

  boot_disk {
    initialize_params {
      image_id = data.yandex_compute_image.ubuntu.image_id
      type     = var.vm_db_type
      size     = var.vm_db_size
    }
  }

  scheduling_policy {
    preemptible = var.vm_db_preemptible
  }

  network_interface {
    subnet_id = yandex_vpc_subnet.develop-b.id
    nat       = var.vm_db_nat
  }

  metadata                  = var.default_metadata
  
}
