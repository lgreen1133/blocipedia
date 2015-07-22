class WikiPolicy < ApplicationPolicy
  def index?
    true
  end

  def show?
    record.public? || user.present? 
  end

  def create?
    user.present? 
  end

  def new?
    create?
  end

  def update?
    user.present? && record.user == user 
  end

  def destroy?
    update?
  end
end