# dotenv-deployment

**This gem is deprecated and no longer maintained. Use `dotenv-rails`, or manually configure [dotenv](https://github.com/bkeepers/dotenv) to meet your own needs.**

If the environment files for your Rails application are in `config`, add the following lines to `config/application.rb` to maintain the behavior that this gem provided.

```ruby
# Load defaults from config/*.env in config
Dotenv.load *Dir.glob(Rails.root.join("config/**/*.env"), File::FNM_DOTMATCH))

# Override any existing variables if an environment-specific file exists
Dotenv.overload *Dir.glob(Rails.root.join("config/**/*.env.#{Rails.env}"), File::FNM_DOTMATCH)
```
