require "dotenv"
require "dotenv/deployment/version"

# Load defaults from .env or *.env in config
Dotenv.load('.env')
if defined?(Rails)
  filenames = Dir.glob("#{Rails.root}/config/**/*.env")
  Dotenv.load(*filenames) if not filenames.empty?
end

# Override any existing variables if an environment-specific file exists
if environment = ENV['RACK_ENV'] || (defined?(Rails) && Rails.env)
  Dotenv.overload(".env.#{environment}")
  if defined?(Rails)
    filenames = Dir.glob("#{Rails.root}/config/**/*.env.#{environment}")
    Dotenv.overload(*filenames) if not filenames.empty?
  end
end
