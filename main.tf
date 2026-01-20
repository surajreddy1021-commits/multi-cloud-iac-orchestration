# AWS Provider Configuration
provider "aws" {
  region = "us-east-1"
}

# Azure Provider Configuration
provider "azurerm" {
  features {}
}

# Provisioning AWS EKS Cluster
resource "aws_eks_cluster" "eks_prod" {
  name     = "multi-cloud-eks"
  role_arn = "arn:aws:iam::123456789012:role/eks-role"
  vpc_config {
    subnet_ids = ["subnet-12345", "subnet-67890"]
  }
}

# Provisioning Azure AKS Cluster
resource "azurerm_kubernetes_cluster" "aks_prod" {
  name                = "multi-cloud-aks"
  location            = "East US"
  resource_group_name = "prod-rg"
  dns_prefix          = "multicloud"

  default_node_pool {
    name       = "default"
    node_count = 2
    vm_size    = "Standard_D2_v2"
  }

  identity {
    type = "SystemAssigned"
  }
}
