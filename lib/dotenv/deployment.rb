require "dotenv"
require "dotenv/deployment/version"

# Load defaults from .env or *.env in config
Dotenv.load '.env'
Dotenv.load *Dir.glob("#{Rails.root}/config/**/*.env")

# Override any existing variables if an environment-specific file exists
if environment = ENV['RACK_ENV'] || Rails.env)
  Dotenv.overload ".env.#{environment}"
  Dotenv.overload *Dir.glob("#{Rails.root}/config/**/*.env.#{environment}")
end
