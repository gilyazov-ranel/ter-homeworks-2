output "virtual_machina" {
    value= [
        {develop-a = ["instance_name: ${yandex_compute_instance.platform-a.name}, external_ip: ${yandex_compute_instance.platform-a.network_interface[0].nat_ip_address}, fqdn: ${yandex_compute_instance.platform-a.fqdn}"]},
        {develop-b = ["instance_name: ${yandex_compute_instance.platform-b.name}, external_ip: ${yandex_compute_instance.platform-b.network_interface[0].nat_ip_address}, fqdn: ${yandex_compute_instance.platform-b.fqdn}"]}
    ]
}
