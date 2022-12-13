resource "okta_app_signon_policy" "passwordless" {
  name        = "Passwordless"
  description = "Authentication Policy that supports passwordless."
}

resource "okta_app_signon_policy_rule" "magic_link" {
  policy_id                   = resource.okta_app_signon_policy.passwordless.id
  name                        = "Magic Link"
  factor_mode                 = "1FA"
  type                        = "ASSURANCE"
  re_authentication_frequency = "PT2H"
}