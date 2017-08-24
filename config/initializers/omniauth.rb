OmniAuth.config.logger = Rails.logger

Rails.application.config.middleware.use OmniAuth::Builder do
  provider :facebook, '1060827510719146', 'e28e885730106c47252265690c5a75e7'
end
