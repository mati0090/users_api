require 'spec_helper'

describe Authentication do
  it "should generate values on create" do
    authentication = Authentication.create
    authentication.uuid.length.should == 32
    authentication.secret_token.length.should == 128
  end
end
