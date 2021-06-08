Rails.application.config.middleware.use OmniAuth::Builder do
  provider :google_oauth2, ENV['GOOGLE_CLIENT_ID'], ENV['GOOGLE_CLIENT_SECRET'], :skip_jwt=>true
end

OmniAuth.config.on_failure = UsersController.action(:oauth_failure)
