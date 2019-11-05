class User < ApplicationRecord
  validates :email, uniqueness: true, presence: true
  before_create :create_api_key
  has_secure_password

  def create_api_key
    self.api_key = SecureRandom.urlsafe_base64
  end
end
