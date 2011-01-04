FactoryGirl.define do

  sequence(:login) {|n| "shingara+#{n}" }
  sequence(:email) {|n| "cyril.mougel+#{n}@example.com" }

  factory :user do
    login { Factory.next(:login) }
    email { Factory.next(:email) }
    password 'tintinpouet'
    password_confirmation 'tintinpouet'
  end
end
