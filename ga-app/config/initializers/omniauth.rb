OmniAuth.config.logger = Rails.logger

Rails.application.config.middleware.use OmniAuth::Builder do
  provider :dbc, ENV['DBC_CLIENT_ID'], ENV['DBC_CLIENT_SECRET']
end