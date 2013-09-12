require 'spec_helper'

describe UsersController do

  describe "GET requests" do
    let!(:bill) {User.create!(:first_name => "Bill", :last_name => "Gates", :hobby => "Philanthropy")}
    let!(:bob)  {User.create!(:first_name => "Bob", :last_name => "Dylan", :hobby => "Signing")}

    it "should response with all users" do
      get :index, format: :json
      body = JSON.parse(response.body)

      body.should == [JSON.parse(bill.to_json), JSON.parse(bob.to_json)]
    end

    it "should response for show action" do
      get :show, :id => bill.id, :format => :json

      response.body.should == bill.to_json
    end

  end

end
