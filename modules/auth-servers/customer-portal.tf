resource "okta_auth_server" "customer_portal" {
  audiences   = ["api://iatcore.com"]
  description = "Auth Server that handles customer-facing apps"
  name        = "Customer Portal"
  issuer_mode = "ORG_URL"
  status      = "ACTIVE"
}

resource "okta_auth_server_scope" "account_read" {
  auth_server_id = okta_auth_server.customer_portal.id
  description    = "This allows the app to view your IATCore account information."
  name           = "iat.account.read"
}

resource "okta_auth_server_claim" "test" {
  auth_server_id = okta_auth_server.customer_portal.id
  name           = "Type"
  value          = "user.userType"
  scopes         = [ okta_auth_server_scope.account_read.name ]
  claim_type     = "IDENTITY"
}

data "okta_group" "everyone" {
  name = "Everyone"
}

resource "okta_auth_server_policy" "default_policy" {
  auth_server_id   = okta_auth_server.customer_portal.id
  status           = "ACTIVE"
  name             = "Default policy"
  description      = "Default policy used to show authorization server"
  priority         = 2
  client_whitelist = [ var.OIDC_Client_Id ]
}

resource "okta_auth_server_policy_rule" "default_rule" {
  auth_server_id       = okta_auth_server.customer_portal.id
  policy_id            = okta_auth_server_policy.default_policy.id
  status               = "ACTIVE"
  name                 = "Default rule"
  priority             = 1
  group_whitelist      = [ data.okta_group.everyone.id ]
  grant_type_whitelist = ["authorization_code", "password", "implicit"]
  scope_whitelist      = ["*"]
}

# Customer Portal policy
resource "okta_auth_server_policy" "customer_portal_policy" {
  auth_server_id   = okta_auth_server.customer_portal.id
  status           = "ACTIVE"
  name             = "Customer Portal App policy"
  description      = "Allows access to scopes for the customer portal app"
  priority         = 1
  client_whitelist = [ var.Customer_Portal_App_Id ]
}

resource "okta_auth_server_policy_rule" "customer_portal_default_rule" {
  auth_server_id       = okta_auth_server.customer_portal.id
  policy_id            = okta_auth_server_policy.customer_portal_policy.id
  status               = "ACTIVE"
  name                 = "Client Credentials/Auth Code"
  priority             = 1
  group_whitelist      = [ data.okta_group.everyone.id ]
  grant_type_whitelist = ["client_credentials", "authorization_code"]
  scope_whitelist      = ["openid", "profile", "iat.account.read"]
}

