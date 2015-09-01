Rails.application.config.middleware.use OmniAuth::Builder do
  provider :facebook, ENV['FACEBOOK_KEY'], ENV['FACEBOOK_SECRET'],
  scope: 'public_profile', info_fields: 'about, name,gender,age_range,email,bio,location'
end
