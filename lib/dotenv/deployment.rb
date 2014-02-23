require "dotenv"
require "dotenv/deployment/version"

# Load defaults
Dotenv.load '.env'

# Override any existing variables if an environment-specific file exists
environment = ENV['RACK_ENV'] || (defined?(Rails) && Rails.env)
Dotenv.overload ".env.#{environment}" if environment
