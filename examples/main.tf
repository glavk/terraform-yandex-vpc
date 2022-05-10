provider "yandex" {
  service_account_key_file = "key.json"
  folder_id                = "xxx"
  zone                     = "ru-central1-a"
}

terraform {
  backend "s3" {
    endpoint   = "storage.yandexcloud.net"
    bucket     = "terraform-dev-state"
    region     = "us-east-1"
    key        = "dev/terraform.tfstate"
    access_key = "xxx"
    secret_key = "xxx"

    skip_region_validation      = true
    skip_credentials_validation = true
  }
}

locals {
  ddos_protected_ips = ["server1.example.com", "server2.example.com"]
  static_ips         = ["server3.example.com", "server4.example.com"]
}

# static ips with ddos protection and without ddos protection
module "vpc_full" {
  source  = "glavk/vpc/yandex"
  version = "0.1.3"

  zone_id                 = "ru-central1-b"
  static_ip_names         = local.static_ips
  ddos_protected_ip_names = local.ddos_protected_ips
}

# static ips without ddos protection only
module "vpc_no_ddos" {
  source  = "glavk/vpc/yandex"
  version = "0.1.3"

  zone_id         = "ru-central1-b"
  static_ip_names = local.static_ips
}
