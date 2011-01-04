require File.dirname(__FILE__) + '/../spec_helper'

describe User do
  it "should be valid" do
    Factory.build(:user).should be_valid
  end
  it { should have_field(:email).of_type(String) }
  it { should have_field(:login).of_type(String) }

  it { should validate_presence_of(:email) }
  it { should validate_presence_of(:login) }
  it { should validate_uniqueness_of(:email) }
  it { should validate_uniqueness_of(:login) }
end
