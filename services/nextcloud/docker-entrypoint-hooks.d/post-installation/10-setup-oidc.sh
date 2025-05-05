#!/bin/bash
set -eu

# Load secrets
OIDC_CLIENT_SECRET=$(< /run/secrets/nextcloud-oidc-secret)

# OIDC config
php occ app:install oidc_login
php occ app:enable oidc_login

php occ config:app:set oidc_login client_id --value=example-client
php occ config:app:set oidc_login client_secret --value=Test125!
php occ config:app:set oidc_login discovery_url --value="https://auth.uwu-ype.eu/realms/example-realm/.well-known/openid-configuration"
php occ config:app:set oidc_login redirect_url --value="https://cloud.uwu-ype.eu/index.php/apps/oidc_login/redirect"
php occ config:app:set oidc_login logout_url --value="https://auth.uwu-ype.eu/realms/example-realm/protocol/openid-connect/logout?redirect_uri=https%3A%2F%2Fcloud.uwu-ype.eu"
php occ config:app:set oidc_login login_button_text --value="Login with SSO"
php occ config:app:set oidc_login login_button_class --value="btn-primary"
php occ config:app:set oidc_login auto_redirect --value=1
php occ config:app:set oidc_login hide_login_form --value=1
php occ config:app:set oidc_login end_session_redirect --value=1
php occ config:app:set oidc_login idp_attribute_username --value=preferred_username
php occ config:app:set oidc_login idp_attribute_email --value=email
php occ config:app:set oidc_login idp_attribute_display_name --value=name
php occ config:system:set overwriteprotocol --value=https
php occ config:app:set oidc_login allow_insecure --value="yes"

echo "✅ OpenID Connect (OIDC) configured post-installation"

