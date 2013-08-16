INSTAGRAM_CONFIG = {
  client_id: ENV['INSTAGRAM_CLIENT_ID'] || raise("No instagram client id environment variable"),
  client_secret: ENV['INSTAGRAM_CLIENT_SECRET'] || raise("No instagram client secret environment variable")
}.freeze

Instagram.configure do |config|
  config.client_id = INSTAGRAM_CONFIG[:client_id]
  config.client_secret = INSTAGRAM_CONFIG[:client_secret]
end
