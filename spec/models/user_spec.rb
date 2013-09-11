require 'spec_helper'

describe User do
  it "should be able to create user" do
    User.create(:first_name => "Bob", :last_name => "Dylan", :hobby => "Signing").should be_true
  end
end
