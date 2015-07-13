class User < ActiveRecord::Base
  has_secure_password
  has_many :wikis

  before_create :confirmation_token 

  private

  def confirmation_token
    self.confirm_token = SecureRandom.urlsafe_base64.to_s
  end
end
