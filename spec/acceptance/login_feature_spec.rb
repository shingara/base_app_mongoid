require File.expand_path(File.dirname(__FILE__) + '/acceptance_helper')

feature "Login Feature", %q{
  In order to ...
  As a ...
  I want to ...
} do

  let(:email) { Factory.next(:email) }
  let(:login) { Factory.next(:login) }

  scenario "Sign up" do
    visit "/"
    page.should_not have_content(login)
    click_link 'Sign up'
    within('h2') do
      page.should have_content('Sign up')
    end

    within('#user_new') do
      fill_in 'user_login', :with => login
      fill_in 'user_email', :with => email
      fill_in 'user_password', :with => 'tintinpouet'
      fill_in 'user_password_confirmation', :with => 'tintinpouet'
    end

    lambda do
      click_button('user_submit')
    end.should change(User, :count).by(1)
    within('table') do
      page.should have_content(login)
    end
  end
end
