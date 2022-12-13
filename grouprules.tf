resource "okta_group_rule" "dmzadmin_grouprule" {
  name              = "DMZ Admins"
  status            = "ACTIVE"
  group_assignments = [ resource.okta_group.dmzadmin_group.id ]
  expression_type   = "urn:okta:expression:1.0"
  expression_value  = "user.department==\"DMZ Ops\""
}