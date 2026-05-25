# frozen_string_literal: true

OmniAuth.config.allowed_request_methods = %i[get post]

Rails.application.config.middleware.use OmniAuth::Builder do
  if Rails.env.local?
    provider :github, ENV.fetch('OAUTH_CLIENT_ID', nil), ENV.fetch('OAUTH_CLIENT_SECRET', nil)
  else
    provider :github,
             Rails.application.credentials.github[:client_id],
             Rails.application.credentials.github[:client_secret]
  end
end
