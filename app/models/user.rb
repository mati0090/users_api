class User < ActiveRecord::Base
  has_one :authentication

  delegate :uuid, :secret_token, :to => :authentication

  after_create :create_authentication

  attr_accessible :first_name, :hobby, :last_name

  RESTRICTED_FIELDS = ['created_at', 'updated_at']
end
