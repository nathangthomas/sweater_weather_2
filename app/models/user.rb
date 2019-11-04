class User < ApplicationRecord
  validates :email, presence: true, uniquness: true
  before_create :api_key_generate
  has_secure_password

  def api_key_generate
    self.api_key = SecureRandom.urlsafe_base64
  end
end
