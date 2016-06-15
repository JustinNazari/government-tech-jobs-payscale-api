# Be sure to restart your server when you modify this file.

# Your secret key for verifying the integrity of signed cookies.
# If you change this key, all old signed cookies will become invalid!

# Make sure the secret is at least 30 characters and all random,
# no regular words or you'll be exposed to dictionary attacks.
# You can use `rake secret` to generate a secure secret key.

# Make sure your secret_key_base is kept private
# if you're sharing your code publicly.

# Although this is not needed for an api-only application, rails4
# requires secret_key_base or secret_token to be defined, otherwise an
# error is raised.
# Using secret_token for rails3 compatibility. Change to secret_key_base
# to avoid deprecation warning.
# Can be safely removed in a rails3 api-only application.

GovernmentTechJobsPayscaleApi::Application.config.secret_token = '0d7bfc8170eaf6a4029350d12c213b382a5e7cf881c74236493b7297fc377ec01b65fbe56fd322bdb8406e208827d6cc6ea42e123f3fda2b4085ffc155ba17cd'
