provider "azurerm" {
  features {}
}

provider "azurerm" {
  features {
    virtual_machine {
      delete_os_disk_on_deletion = false
      ##it will ensure when the vm is destro disk is not delete. 

    }
    backend "azurerm" {
        resource_group_name = "terraformrg"
        storage_account_name = "errafromkyndteststorage"
        container = "tfstatebcsr"
        key = "project.tfstate"
    }
  }
  alias = "provider2-westus"
  #cleintid="XXXXX"
  ##clientsecret = "YYYY"
  #environment = "us2"
  #"subscription_id"="1221212"
}
terraform {
  required_providers {
    azurerm = {
      source = "hashicorp/azurerm"
      #source = "hashicorp/aws"
      #version = "2.40.0"
    }
  }
}