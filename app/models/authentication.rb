class Authentication < ActiveRecord::Base
  belongs_to :user
  attr_accessible nil

  before_save :generate_values

  private

    def generate_values
      self.uuid = SecureRandom.hex
      self.secret_token = SecureRandom.hex(64)
    end
end
