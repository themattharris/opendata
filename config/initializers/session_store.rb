# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_opendata_session',
  :secret      => 'cabd87f402d974073a5e924ef227cf419adc82dd281ba8e59e1d987216f0fe13f5f7e2a0df7f5a6ddbbf3f467f77c0e7b10f1552f9d2b4636994b153a17eb872'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
