resource "okta_group" "service_accounts" {
    name        = "Okta Service Accounts"
    description = "Group that contains all users that represent Service Accounts"
}

resource "okta_group" "dmzadmin_group" {
    name = "DMZ Server Admins"
    description = "Group that contains employees that are responsible for DMZ Servers"
}