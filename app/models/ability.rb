class Ability
  include CanCan::Ability

  def initialize(admin)
    admin ||= AdminUser.new
    if admin.super_admin?
      can :manage, :all
    else
      can :read, ActiveAdmin::Page, name: "Dashboard"
      # can :read, :restaurant,
      can :manage, Restaurant, admin_user_id: admin.id
      # can :read, :all

    end
  end
end
