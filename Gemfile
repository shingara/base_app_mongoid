source 'http://rubygems.org'

RAILS_VERSION = '~> 3.1.0'

gem 'activesupport',      RAILS_VERSION, :require => 'active_support'
gem 'actionpack',         RAILS_VERSION, :require => 'action_pack'
gem 'actionmailer',       RAILS_VERSION, :require => 'action_mailer'
gem 'railties',           RAILS_VERSION, :require => 'rails'

gem 'haml'
gem "haml-rails"
gem 'bson_ext'
gem 'decent_exposure'
gem 'omniauth'
gem 'twitter'

gem 'mongoid', '~> 2.1.0' # the 2.2.x version need MongoDB 2.0.0 still in beta
gem 'devise'

gem 'simple_form'

# Gems used only for assets and not required
# in production environments by default.
group :assets do
  gem 'sass-rails', RAILS_VERSION
  gem 'coffee-rails', RAILS_VERSION
  gem 'uglifier'
end

group :test, :development do
  gem "rspec-rails"
  gem 'steak'
  gem "nifty-generators"
end

group :test do
  gem "database_cleaner"
  gem "capybara"
  gem 'launchy'

  gem 'mongoid-rspec'
  gem 'fabrication'
  gem 'randexp'
end
