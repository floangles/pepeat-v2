require 'sidekiq/web'

Sidekiq.configure_server do |config|
  config.redis = { url: ENV.fetch("REDISCLOUD_URL") }
end

Sidekiq.configure_client do |config|
  config.redis = { url: ENV.fetch("REDISCLOUD_URL") }
end