Rails.application.config.middleware.use OmniAuth::Builder do
  provider :github, Settings.github.id, Settings.github.secret
end
