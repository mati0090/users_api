require 'spec_helper'

describe Authentication do
  let(:user) {User.create!(:first_name => "Bill", :last_name => "Gates", :hobby => "Philanthropy")}

  it "should generate values on create" do
    authentication = user.authentication
    authentication.uuid.length.should == 32
    authentication.secret_token.length.should == 128
  end
end
