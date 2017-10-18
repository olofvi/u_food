class Ability
  include CanCan::Ability

  def initialize(admin)
    admin ||= AdminUser.new
      if admin.super_admin?
        can :manage, :all
      else
        can :read, :all
        can [:update], User, id: @user.id
        
      end
  end
end