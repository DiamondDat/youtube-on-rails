Yt.configure do |config|
  config.api_key = Rails.application.credentials.gg_api_key

  config.log_level = :debug
end
