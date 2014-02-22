source 'https://rubygems.org'

ruby '2.1.0'

gem 'rails', '4.0.3'

gem 'rake'

gem 'pg'

gem 'sass-rails'
gem 'haml-rails'

gem 'uglifier'

gem 'coffee-rails'

gem 'jquery-rails'

gem 'foundation-rails'

gem 'turbolinks'

gem 'jbuilder'

group :doc do
  gem 'sdoc', require: false
end

gem 'bcrypt-ruby'

gem 'capistrano', group: :development

gem 'foreman'
gem 'unicorn'

gem 'devise'
gem 'cancan'

# control the pow server, in case we want to use rails server directly
gem 'powder'

group :development, :test do
  gem 'pry'
  gem 'pry-remote'
  gem 'pry-stack_explorer'
  gem 'pry-debugger'
  
  gem 'rspec-rails'
  gem 'factory_girl_rails'
  
  # DRb server for testing frameworks
  gem 'spork', :github => 'sporkrb/spork'
  gem 'spork-rails', :github => 'sporkrb/spork-rails'
  
  # command line tool to easily handle events on file system modifications
  gem 'guard'
  gem 'guard-bundler'
  gem 'guard-rspec', require: false
  gem 'guard-spork'
  gem 'guard-livereload', require: false

  gem 'growl',  require: false
end

group :development do
  gem 'better_errors'
  gem 'binding_of_caller'
  gem 'spring'
  gem 'meta_request' # enables RailsPanel in Chrome
end

group :test do
end

group :production do
  gem 'rails_12factor'
end