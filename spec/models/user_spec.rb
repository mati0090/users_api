require 'spec_helper'

describe User do
  it "should be able to create user" do
    User.create(:first_name => "Bob", :last_name => "Dylan", :hobby => "Signing").should be_true
  end

  it "should create authentication model on create" do
    user = User.create(:first_name => "Bob", :last_name => "Dylan", :hobby => "Signing")
    user.authentication.should be_present
  end
end
