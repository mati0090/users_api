class Authentication < ActiveRecord::Base
  belongs_to :user
  attr_accessible :secret_token, :uuid

  before_save :generate_values

  private

    def generate_values
      self.uuid = SecureRandom.hex
      self.secret_token = SecureRandom.hex(64)
    end
end
