variable "static_ip_names" {
  description = "Yandex.Cloud list of reserved (static) IP address names"
  type        = list(string)
}

variable "ddos_protected_ip_names" {
  description = "Yandex.Cloud list of DDoS protected IP address"
  type        = list(string)
}

variable "folder_id" {
  description = "Yandex.Cloud folder ID where resources will be created. If it is not provided, the default provider folder is used."
  type        = string
}

variable "zone_id" {
  description = "Yandex.Cloud zone ID for provisioned resources"
  type        = string
  default     = "ru-central1-b"

  validation {
    condition     = contains(["ru-central1-a", "ru-central1-b", "ru-central1-c"])
    error_message = "Zone must be one of: ru-central1-a, ru-central1-b, ru-central1-c"
  }
}
