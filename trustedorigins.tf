resource "okta_trusted_origin" "super_widget" {
  name   = "super-widget"
  origin = "https://super-widget.oktaprise.com"
  scopes = ["CORS", "REDIRECT"]
}

resource "okta_trusted_origin" "customer_portal_local" {
  name   = "customerportal.local"
  origin = "https://localhost:44369/"
  scopes = ["CORS"]
}
