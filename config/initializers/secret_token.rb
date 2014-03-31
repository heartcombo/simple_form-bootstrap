# Be sure to restart your server when you modify this file.

# Your secret key is used for verifying the integrity of signed cookies.
# If you change this key, all old signed cookies will become invalid!

# Make sure the secret is at least 30 characters and all random,
# no regular words or you'll be exposed to dictionary attacks.
# You can use `rake secret` to generate a secure secret key.

# Make sure your secret_key_base is kept private
# if you're sharing your code publicly.
SimpleFormBootstrap::Application.config.secret_key_base = ENV['SECRET_TOKEN'] || '16d5681f86d30e433e10f37f059837c91510a8a9a410fb6234ae8a102882a669bcf19edd27be9d93562c7c49db6c7503051d97320d84d39c2648ff1b8c7d1e1f'
