class Wiki < ActiveRecord::Base
  belongs_to :user
  has_many :collaborators
  has_many :users, through: :collaborators

  # scope :visible_to, -> (user) { user && (user.premium? || user.admin? || @collaborator_for?(user)) ? all : where(public: true)  }
  # scope :visible_to, -> (user) { user && (user.premium? || user.admin?) ? all : user.collaborator_for.present? ? user.collaborator_for : where(public: true)  }
  # scope :visible_to, -> (user) { user && (user.premium? || user.admin?) ? all : user.collab_wikis.present? ? user.collab_wikis : where(public: true)  }
  scope :visible_to, -> (user) { user && (user.premium? || user.admin?) ? all : user.collab_wikis + where(public: true)  }
  scope :publicly_visible, -> {where(public: true)}

  # def collaborator_for(user)
  #   self.collaborators.include?(user)
  # end

end
