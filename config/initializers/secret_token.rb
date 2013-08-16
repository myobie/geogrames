Geogrames::Application.config.secret_key_base = ENV["SECRET_KEY_BASE"] || !Rails.logger.error("There is no secret key base environment variable")
