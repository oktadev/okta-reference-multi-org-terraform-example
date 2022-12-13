resource "okta_authenticator" "email" {
	name = "Email"
	key = "okta_email"
	settings = jsonencode (
		{
			"allowedFor": "any"
			"tokenLifetimeInMinutes" : 5
		}
	)
}

resource "okta_authenticator" "webauthn" {
	name = "Web AuthN"
	key = "webauthn"
}