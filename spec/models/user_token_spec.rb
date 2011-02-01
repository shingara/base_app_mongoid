require 'spec_helper'

describe UserToken do
  it { should have_field(:uid).of_type(String) }
  it { should have_field(:provider).of_type(String) }
  it { should be_embedded_in(:user).of_type(User) }
end
