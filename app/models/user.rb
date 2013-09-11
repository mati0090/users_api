class User < ActiveRecord::Base
  attr_accessible :first_name, :hobby, :last_name
end
