# frozen_string_literal: true

class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new
    can :read, :all
    can :create, :all

    return unless user.present?

    can :edit, User, author_id: user.id
    can :destroy, :Category, author_id: user.id
    can :destroy, :Purchase, author_id: user.id
  end
end