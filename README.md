# Dotenv::Deployment

TODO: Write a gem description

## Installation

Add this line to your application's Gemfile:

    gem 'dotenv-deployment'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install dotenv-deployment

## Usage

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
