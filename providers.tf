# Add Okta provider
terraform {
  required_providers {
    okta = {
      source = "okta/okta"
      version = "~> 3.35"
    }
  }
}

provider "okta" {
    org_name = var.org_name
    base_url = var.base_url
    api_token = var.api_token
}

