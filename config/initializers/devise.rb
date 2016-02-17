Devise.setup do |config|
  config.scoped_views = true
  # Email setup
  config.mailer_sender = 'accounts@clique.com'
  require 'devise/orm/active_record'
  config.case_insensitive_keys = [:email]
  config.strip_whitespace_keys = [:email]
  # Default
  config.skip_session_storage = [:http_auth]
  config.stretches = Rails.env.test? ? 1 : 10
  config.reconfirmable = true
  config.expire_all_remember_me_on_sign_out = true
  config.password_length = 8..72
  config.reset_password_within = 6.hours
  config.sign_out_via = :delete
  # Omniauth
  config.omniauth :facebook, ENV['CLIQUE_FACEBOOK_KEY'], ENV['CLIQUE_FACEBOOK_SECRET'], \
  scope: 'email, user_birthday, user_location', info_fields: 'email, first_name, last_name',
  :image_size => 'large'
end
