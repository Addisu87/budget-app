class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new
    can :read, :all
    can :create, :all

    return unless user.present?

    can :manage, User, author_id: user.id
    can :manage, Category, author_id: user.id
    can :manage, Purchase, author_id: user.id
  end
end
