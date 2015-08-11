class WikiPolicy < ApplicationPolicy
  def index?
    true
  end

  def show?
    record.public? || user.present? && (record.user == user || user.admin? || user.premium? || record.users.include?(user))
  end

  def create?
    user.present? 
  end

  def new?
    create?
  end

  def update?
    user.present? && (record.user == user || user.admin? || record.users.include?(user))
  end

  def destroy?
    update?
  end

  class Scope
    attr_reader :user, :scope
 
    def initialize(user, scope)
      @user = user
      @scope = scope
    end
 
    def resolve
      if @user.present?
        wikis = Wiki.visible_to(@user)
      else
        wikis = Wiki.publicly_visible
      end
    end
  end
end