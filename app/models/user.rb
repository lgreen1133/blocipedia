class User < ActiveRecord::Base
  attr_accessor :skip_confirmation 
  has_secure_password
  has_many :wikis

  has_many :collaborators
  has_many :collab_wikis, source: :wiki, through: :collaborators

  before_create :confirmation_token, unless: :skip_confirmation
  after_create :deliver_welcome_email, unless: :skip_confirmation
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

  def skip_confirmation!
    self.skip_confirmation = true
  end

  private

  def confirmation_token
    self.confirm_token = SecureRandom.urlsafe_base64.to_s
  end

  def default_role
    self.role = 'standard' if self.role.blank?
  end 

  def deliver_welcome_email
    UserMailer.registration_confirmation(self).deliver_now
  end
end
