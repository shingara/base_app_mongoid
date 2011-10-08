require File.expand_path(File.dirname(__FILE__) + "/../spec_helper")
require "steak"
require 'capybara/rails'

module Steak::Capybara
  include Rack::Test::Methods
  include Capybara::DSL

  def app
    ::Rails.application
  end

  ##
  # Logged user and check if really logged
  def logged_with(user, password='tintinpouet')
    visit "/"
    click_link 'sign in'
    within('h2') do
      page.should have_content(I18n.t('devise.sessions.new.title_h2'))
    end

    within('#user_new') do
      fill_in 'user_email', :with => user.login
      fill_in 'user_password', :with => password
    end

    click_button(I18n.t('devise.sessions.new.sign_in'))
    page.should have_content("Signed in as #{user.login}")
  end

end

RSpec.configuration.include Steak::Capybara, :type => :acceptance

# Put your acceptance spec helpers inside /spec/acceptance/support
Dir["#{File.dirname(__FILE__)}/support/**/*.rb"].each {|f| require f}
