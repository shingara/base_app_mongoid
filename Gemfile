source 'http://rubygems.org'

gem 'rails', '3.0.3'
gem 'mongoid',
  :git => 'git://github.com/mongoid/mongoid.git'
gem 'haml'
gem "haml-rails"
gem 'devise', :git => 'git://github.com/plataformatec/devise.git'
gem 'bson_ext'
gem 'inherited_resources'

gem "nifty-generators", :group => :development

group :test, :development do
  gem "rspec-rails"
end

group :test do
  gem 'mongoid-rspec',
    :git => 'git://github.com/shingara/mongoid-rspec.git',
    :branch => 'mongoid-2.0.0.rc1'
  gem 'factory_girl',
    :git => 'git://github.com/thoughtbot/factory_girl.git'
  gem "cucumber-rails"
  gem "database_cleaner"
  gem "capybara"
end
