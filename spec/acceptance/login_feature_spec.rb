require File.expand_path(File.dirname(__FILE__) + '/acceptance_helper')

feature "Login Feature" do

  let(:email) { Factory.next(:email) }
  let(:login) { Factory.next(:login) }
  let(:shingara_user) {
    u = User.where(:login => 'shingara').first
    unless u
      u = Factory(:user, :login => 'shingara')
    end
    u
  }

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
    page.should have_content("Signed in as #{login}")
    within('table') do
      page.should have_content(login)
    end
    click_link "Sign out"
  end

  {
    :good_signin => {:login => 'shingara', :password => 'tintinpouet', :success => true},
    :bad_login => {:login => 'hello', :password => 'tintinpouet', :success => false},
    :bad_password => {:login => 'shingara', :password => 'hello', :success => false},
  }.each do |sce, value|
    scenario sce do
      shingara_user
      visit "/"
      click_link 'sign in'
      within('h2') do
        page.should have_content('Sign in')
      end

      within('#user_new') do
        fill_in 'user_email', :with => value[:login]
        fill_in 'user_password', :with => value[:password]
      end

      click_button('user_submit')
      if value[:success]
        page.should have_content("Signed in as #{value[:login]}")
        click_link "Sign out"
      else
        page.should_not have_content("Signed in as #{value[:login]}")
      end
    end

  end

  scenario "can logout" do
    logged_with(shingara_user)
    click_link "Sign out"
    page.should have_content("sign in")
    page.should_not have_content("Signed in as #{shingara_user.login}")
  end

end