locals {}

################################################################################
# Static IP with DDoS protection (optional)
################################################################################

resource "yandex_vpc_address" "static_ip" {
  description = "Static IP without DDoS protection for ${each.value}"

  for_each = toset(var.static_ip_names)
  name     = each.value

  #folder_id = var.folder_id

  external_ipv4_address {
    zone_id = var.zone_id
  }
}

resource "yandex_vpc_address" "protected_ip" {
  description = "Static IP with DDoS protection for ${each.value}"

  for_each = toset(var.ddos_protected_ip_names)
  name     = each.value

  #folder_id = var.folder_id

  external_ipv4_address {
    zone_id                  = var.zone_id
    ddos_protection_provider = "qrator"
  }
}