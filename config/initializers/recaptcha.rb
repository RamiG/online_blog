Recaptcha.configure do |config|
  config.public_key  = RECAPTCHA_PUBLIC_KEY
  config.private_key = RECAPTCHA_PRIVATE_KEY
  config.proxy = 'http://www.google.com/recaptcha/api/verify'
end