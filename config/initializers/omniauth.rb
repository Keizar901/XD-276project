Rails.application.config.middleware.use OmniAuth::Builder do
  provider :facebook, '803217126486136', 'fd8e2f5031ba9019c3b899e0d47affbb', scope: 'email', info_fields: 'email, first_name, last_name'
end
