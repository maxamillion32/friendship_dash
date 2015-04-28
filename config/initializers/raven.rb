require "raven"

Raven.configure do |config|
  config.environments = %w( staging production )
  dsn = Rails.application.config.try(:sentry_dsn)
  config.dsn = dsn if dsn
end
