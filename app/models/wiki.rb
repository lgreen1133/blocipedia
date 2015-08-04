class Wiki < ActiveRecord::Base
  belongs_to :user
  has_many :collaborators
  has_many :users, through: :collaborators

  scope :visible_to, -> (user) { user && (user.premium? || user.admin?) ? all : where(public: true)  }
  # scope :visible_to, -> (user) { where('user_id = ? OR public = ?', user.id, true) }
  scope :publicly_visible, -> {where(public: true)}
  #scope :visible_to, -> (user) { user && user.premium? }
end
