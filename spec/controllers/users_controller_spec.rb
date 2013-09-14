require 'spec_helper'

class ActiveRecord::Base
  def to_json_without_auth
    self.to_json(:except => User::RESTRICTED_FIELDS)
  end
end

describe UsersController do
  let!(:bill) {User.create!(:first_name => "Bill", :last_name => "Gates", :hobby => "Philanthropy")}
  let!(:bob)  {User.create!(:first_name => "Bob", :last_name => "Dylan", :hobby => "Signing")}
  let(:new_bill_attributes) { {:hobby => "Programming"} }

  describe "GET requests without authentication" do

    it "should response with all users" do
      get :index, :format => :json
      body = JSON.parse(response.body)

      body.should == [JSON.parse(bill.to_json_without_auth), JSON.parse(bob.to_json_without_auth)]
    end

    it "should response for show action" do
      get :show, :id => bill.id, :format => :json

      response.body.should == bill.to_json_without_auth
    end

    it "should send 403 on update" do
      put :update, :id => bill.id, :format => :json, :user => new_bill_attributes

      response.status.should == 403
    end

  end

  describe "authenticated requests" do

    it "should show all fields on GET show" do
      get :show, :id => bill.id, :uuid => bill.uuid, :secret_token => bill.secret_token, :format => :json
      body = JSON.parse(response.body)

      body.should == JSON.parse(bill.to_json)
    end

    it "should be able to UPDATE user" do
      put :update, :id => bill.id, :uuid => bill.uuid, :secret_token => bill.secret_token, :user => new_bill_attributes, :format => :json

      bill.reload
      bill.hobby.should == "Programming"

      response.status.should == 204
    end

  end

end
