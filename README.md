# dotenv-deployment

[dotenv](https://github.com/bkeepers/dotenv) is designed to load configuration variables into `ENV` in *development*. It does not concern itself with production environments because there are typically better ways to manage configuration in those environments—such as `/etc/environment` managed by [Puppet](https://github.com/puppetlabs/puppet) or [Chef](https://github.com/opscode/chef), `heroku config`, etc.

However, some find dotenv to be a convenient way to configure applications in staging and production environments. This gem makes it easier to do that by adding support for:

* [multiple environments](#multiple-environments)
* [Capistrano](#capistrano)

## Installation

Add this line to your application's Gemfile:

    gem 'dotenv-deployment'

And then execute:

    $ bundle

## Usage

## Multiple Environments

By default `.env` will be loaded when `dotenv-deployment` is required. It will not override existing environment variables.

If you're using Rails or `ENV['RACK_ENV']` is set, an environment-specific file (like `.env.production`) will be loaded and override any existing variables. In a Rails project, `config/*.env` and `config/*.env.#{environment}` will also be loaded.

## Capistrano

### Capistrano 2

Add the gem to your `config/deploy.rb` file:

```ruby
require "dotenv/deployment/capistrano"
```

**NOTE: If you are upgrading from previous versions of dotenv, you will need to change your require from "dotenv/capistrano" to "dotenv/deployment/capistrano".**

It will symlink the `.env` located in `/path/to/shared` in the new release.

### Capistrano 3

Just add `.env` to the list of linked files, for example:

```ruby
set :linked_files, %w{config/database.yml .env}
```

## Contributing

1. Fork it ( http://github.com/bkeepers/dotenv-deployment/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
