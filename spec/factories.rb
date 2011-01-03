FactoryGirl.define do
  factory :user do
    login 'shingara'
    email  'cyril.mougel@gmail.com'
    password 'tintinpouet'
    password_confirmation 'tintinpouet'
  end
end
