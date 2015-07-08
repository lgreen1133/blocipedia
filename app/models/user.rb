class User < ActiveRecord::Base
  has_secure_password

  attr_accessible :email, :password, :password_confirmation, :name 

  before_create :generate_confirmation_token 

  private

  def generate_confirmaton_token
    self.confirmation_token = SecureRandom.urlsafe_base64
  end
end
