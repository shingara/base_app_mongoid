source 'http://rubygems.org'

gem 'rails'
gem 'haml'
gem "haml-rails"
gem 'bson_ext'
gem 'inherited_resources', '=1.2.0'
gem 'omniauth'

gem 'mongoid', :git => 'git://github.com/mongoid/mongoid.git'
gem 'devise', :git => 'git://github.com/plataformatec/devise.git'

group :test, :development do
  gem "rspec-rails"
  gem 'steak'
  gem "nifty-generators"
end

group :test do
  gem "database_cleaner"
  gem "capybara"

  gem 'mongoid-rspec', :git => 'git://github.com/durran/mongoid-rspec.git'
  gem 'factory_girl', :git => 'git://github.com/thoughtbot/factory_girl.git'
end
