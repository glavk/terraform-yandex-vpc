# Terraform module for Yandex.Cloud VPC

Terraform module which creates [vpc resources](https://cloud.yandex.ru/services/vpc) on [Yandex.Cloud](https://cloud.yandex.ru/).

## Usage

Before using this module, you need to configure provider (or copy `versions.tf`):
```terraform
terraform {
  required_version = ">= 0.13"

  required_providers {
    yandex = {
      source  = "yandex-cloud/yandex"
      version = ">= 0.47.0"
    }

  }
}
```