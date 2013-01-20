source 'http://rubygems.org'

gem 'rails', '3.2.11'
gem 'railties', '3.2.11'

# Bundle edge Rails instead:
# gem 'rails',     :git => 'git://github.com/rails/rails.git'

# for Heroku deployment - as described in Ap. A of ELLS book
group :development, :test do
  gem 'sqlite3'
  gem 'ruby-debug19', :require => 'ruby-debug'
  gem 'cucumber-rails'
  gem 'cucumber-rails-training-wheels'
  gem 'database_cleaner'
  gem 'capybara'
  gem 'launchy'
  gem 'rspec-rails'
  gem 'simplecov'
  gem 'lazy_high_charts'
end
group :production do
  gem 'pg'
  gem 'lazy_high_charts'
end

# Gems used only for assets and not required
# in production environments by default.
group :assets do
  #gem 'railties', '3.1.0.rcl'
  gem 'therubyracer'              
  gem 'sass-rails' #, "  ~> 3.1.0"
  gem 'coffee-rails'#, "~> 3.1.0"
  gem 'uglifier'
end

gem 'jquery-rails'

#gem 'lazy_high_charts'

# Use unicorn as the web server
# gem 'unicorn'

# Deploy with Capistrano
# gem 'capistrano'

# To use debugger
gem 'haml'
