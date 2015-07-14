class User < ActiveRecord::Base
  has_secure_password
  has_many :wikis

  before_create :confirmation_token
  after_initialize :default_role 

  def admin?
    role == 'admin'
  end

  def standard?
    role == 'standard'
  end

  def premium?
    role == 'premium'
  end

  private

  def confirmation_token
    self.confirm_token = SecureRandom.urlsafe_base64.to_s
  end

  def default_role
    self.role = 'standard'
  end 
end
