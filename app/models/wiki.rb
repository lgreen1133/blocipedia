class Wiki < ActiveRecord::Base
  belongs_to :user
  has_many :collaborators
  has_many :users, through: :collaborators

  extend FriendlyId
  friendly_id :title, :use => :slugged 

  def should_generate_new_friendly_id?
    title_changed?
  end
end
