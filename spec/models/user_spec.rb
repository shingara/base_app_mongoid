require File.dirname(__FILE__) + '/../spec_helper'

describe User do
  it "should be valid" do
    Factory.build(:user).should be_valid
  end
  it { should have_field(:email).of_type(String) }
  it { should have_field(:login).of_type(String) }

  it { should embed_many(:user_tokens).of_type(UserToken) }

  it { should validate_presence_of(:email) }
  it { should validate_presence_of(:login) }
  it { should validate_uniqueness_of(:email) }
  it { should validate_uniqueness_of(:login) }

  describe ".find_for_database_authentication" do
    let(:user) { Factory(:user) }

    it 'should return user by email' do
      User.find_for_database_authentication(:email => user.email).should == user
    end

    it 'should return user by login' do
      User.find_for_database_authentication(:email => user.login).should == user
    end
    it 'should return nothing if not good login or email' do
      User.find_for_database_authentication(:email => 'hello').should be_nil
    end
  end

  describe "validation" do
    it 'should not have 2 user with same provider/uid' do
      u = Factory(:user)
      u.user_tokens.create(:provider => 'twitter', :uid => '1234')
      u.save

      u = Factory(:user)
      u.user_tokens.build(:provider => 'twitter', :uid => '1234')
      u.should_not be_valid
    end
  end
end
