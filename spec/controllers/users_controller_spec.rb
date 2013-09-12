require 'spec_helper'

describe UsersController do

  it "should response with all users" do
    bill = User.create!(:first_name => "Bill", :last_name => "Gates", :hobby => "Philanthropy")
    bob  =User.create!(:first_name => "Bob", :last_name => "Dylan", :hobby => "Signing")

    get :index, format: :json
    body = JSON.parse(response.body)

    body.should == [JSON.parse(bill.to_json), JSON.parse(bob.to_json)]
  end

end
