class User < ActiveRecord::Base
  has_one :authentication

  after_create :create_authentication

  attr_accessible :first_name, :hobby, :last_name
end
