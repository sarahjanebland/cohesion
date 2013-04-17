Rails.application.config.middleware.use OmniAuth::Builder do
  provider :github, Settings.github.id, Settings.github.secret
  provider :facebook, Settings.facebook.id, Settings.facebook.secret, :scope => 'email,user_birthday', :display => 'popup'
  provider :twitter, Settings.twitter.id, Settings.twitter.secret
end
