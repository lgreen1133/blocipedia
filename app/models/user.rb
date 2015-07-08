class User < ActiveRecord::Base
  has_secure_password

  before_create :generate_confirmation_token 

  private

  def generate_confirmaton_token
    self.confirmation_token = SecureRandom.urlsafe_base64
  end
end
