require "dotenv"
require "dotenv/deployment/version"

rails_root = File.absolute_path("./")

# Load defaults from .env or *.env in config
Dotenv.load('.env')
Dotenv.load(*Dir.glob("#{rails_root}/config/**/*.env")) if defined?(Rails)

# Override any existing variables if an environment-specific file exists
if environment = ENV['RACK_ENV'] || (defined?(Rails) && Rails.env)
  Dotenv.overload(".env.#{environment}")
  Dotenv.overload(*Dir.glob("#{rails_root}/config/**/*.env.#{environment}")) if defined?(Rails)
end
