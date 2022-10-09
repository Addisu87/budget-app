# frozen_string_literal: true

class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new

    return unless user.present?

    can :read, :all

    return unless user.admin?

    can :manage, :Category, user: user
    can :manage, :Purchase, user:
  end
end
