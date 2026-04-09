# frozen_string_literal: true

class UserPolicy < ApplicationPolicy
  def index?
    true
  end

  def permitted_attributes
    all = %i[name avatar]
    all.push(:role) if user.admin?

    return all unless self?

    all.push(:reset_password_token)
    all.push(:password)
    all.push(:password_confirmation)
    all
  end

  class Scope < ApplicationPolicy::Scope
    def resolve
      if user.admin?
        scope.all
      else
        scope.where(id: user.id)
      end
    end
  end

  private

  def self?
    user == record
  end
end
