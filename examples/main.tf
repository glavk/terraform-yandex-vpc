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

module "vpc" {
  source  = "glavk/vpc/yandex"
  version = "0.1.0"

  zone_id = "ru-central1-b"
  static_ip_names = local.static_ips

}
