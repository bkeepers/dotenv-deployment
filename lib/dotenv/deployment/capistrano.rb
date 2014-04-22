require 'capistrano/version'

if defined?(Capistrano::VERSION) && Capistrano::VERSION >= '3.0'
  raise 'Please read https://github.com/bkeepers/dotenv-deployment#capistrano to update your dotenv configuration for new Capistrano version'
else
  require 'dotenv/deployment/capistrano/recipes'

  Capistrano::Configuration.instance(:must_exist).load do
    before "deploy:finalize_update", "dotenv:symlink"
  end
end
