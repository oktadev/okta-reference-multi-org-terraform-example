#TODO: Add refresh token rotation configuration (Okta provider needs to be updated to enable this feature

resource "okta_app_oauth" "customer_portal" {
  status         = "ACTIVE"
  label          = "Customer Portal"
  type           = "web"
  redirect_uris  = ["https://localhost:44369/signin-oidc", "https://localhost:44369/Customer", "https://oauth.pstmn.io/v1/callback"]
  post_logout_redirect_uris = ["https://localhost:44369/signout-callback-oidc"]
  login_uri      = "https://localhost:44369/signin-oidc"
  grant_types    = ["client_credentials", "authorization_code", "refresh_token"]
  response_types = ["code"]
  consent_method = "TRUSTED"
  refresh_token_rotation = "ROTATE"
  skip_users = true
  skip_groups = true
}
