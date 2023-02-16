# frozen_string_literal: true

class Ability
  include CanCan::Ability

  def initialize(user)
    user.roles.each do |role| 
      case role.name
      when "admin"
        can :manage, :all
        can :access, :rails_admin
      when "manager"
        can :manage, :all
        cannot :access, :rails_admin
      else
        cannot :manage, :all
        cannot :access, :rails_admin
      end
    end
  end
end
