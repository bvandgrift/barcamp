# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_barcamp_session',
  :secret      => 'c3d872a523c4fd1c511138aea65e36be766b2acf1943bfe43d727597bce14d08ee573e3663231155a10f0ed42f9259ef45cce91f7d16ec730ee08cdf8c24a86d'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
