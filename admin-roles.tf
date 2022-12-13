resource "okta_admin_role_custom" "app_admin" {
  label       = "App Admin Role"
  description = "This role users to manage applications"
  permissions = ["okta.apps.manage"]
}