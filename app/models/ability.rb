class Ability
  include CanCan::Ability

  def initialize(admin)
    admin ||= AdminUser.new
    if admin.super_admin?
      can :manage, :all
    else
      can :read, :all
      can :manage, Restaurant, admin_user_id: admin.id

    end
  end
end