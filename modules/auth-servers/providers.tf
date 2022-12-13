# Add Okta provider
terraform {
  required_providers {
    okta = {
      source = "okta/okta"
      version = "~> 3.35"
    }
  }
}
