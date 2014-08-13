OmniAuth.config.logger = Rails.logger

Rails.application.config.middleware.use OmniAuth::Builder do
  provider :facebook, '169117906620153', '5b339c680ba242352b7b8d48094e488d'
end