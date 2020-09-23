# frozen_string_literal: true

class Ability
  include CanCan::Ability

  def initialize(user)
    can :manage, :all if user.role == "admin"
    can :update, Order if user.role == "cooker"
    can :manage, [Order, Bill] if user.role == "clerk"
  end
end
