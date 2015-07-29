class WikiPolicy < ApplicationPolicy
  def index?
    true
  end

  def show?
    record.public? || user.present? && (record.user == user || user.admin? || record.users.include?(user))
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
       wikis = []
       if user.role == 'admin'
         wikis = scope.all  
       elsif user.role == 'premium'
         all_wikis = scope.all
         all_wikis.each do |wiki|
           if wiki.public? || wiki.user == user || wiki.users.include?(user)
             wikis << wiki 
           end
         end
       else 
         all_wikis = scope.all
         wikis = []
         all_wikis.each do |wiki|
           if wiki.public? || wiki.users.include?(user)
             wikis << wiki 
           end
         end
       end
       wikis
     end
   end
end