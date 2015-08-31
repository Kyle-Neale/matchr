Rails.application.config.middleware.use OmniAuth::Builder do
  provider :facebook, ENV['FACEBOOK_KEY'], ENV['FACEBOOK_SECRET'],{
  	             :scope => 'email,user_location,user_birthday,user_about_me',
  }

end