require "dotenv"
require "dotenv/deployment/version"
require "dotenv/core-ext/dotenv/parser"
require "dotenv/core-ext/dotenv/environment"
require "dotenv/core-ext/dotenv"

# Load defaults from .env or *.env in config
Dotenv.load '.env'
Dotenv.load *Dir.glob("#{Rails.root}/config/**/*.env") if defined?(Rails)

Dotenv.overload ".env.yml"
Dotenv.load *Dir.glob("#{Rails.root}/config/**/*.env.yml") if defined?(Rails)

# Override any existing variables if an environment-specific file exists
if environment = ENV['RACK_ENV'] || (defined?(Rails) && Rails.env)
  Dotenv.overload ".env.#{environment}"
  Dotenv.overload *Dir.glob("#{Rails.root}/config/**/*.env.#{environment}") if defined?(Rails)

  Dotenv.overload ".env.#{environment}.yml"
  Dotenv.overload *Dir.glob("#{Rails.root}/config/**/*.env.#{environment}.yml") if defined?(Rails)
end
