require "dotenv"
require "dotenv/deployment/version"

# Load defaults from .env or *.env in config
Dotenv.load('.env')
Dotenv.load(*Dir.glob("#{Rails.root}/config/**/*.env")) if defined?(Rails)

# Override any existing variables if an environment-specific file exists
if environment = ENV['RACK_ENV'] || (defined?(Rails) && Rails.env)
  Dotenv.overload(".env.#{environment}")
  if defined?(Rails)
    config_env = Dir.glob("#{Rails.root}/config/**/*.env.#{environment}")
    Dotenv.overload(*config_env) if config_env.any?
  end
end
