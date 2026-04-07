# frozen_string_literal: true

class CrabPolicy < ApplicationPolicy
  def index?
    true
  end

  def show?
    true
  end

  def create?
    true
  end

  def update?
    true
  end

  def destroy?
    true
  end

  def restart?
    true
  end

  def upgrade?
    true
  end

  def permitted_attributes
    all = %i[name template_id]
    all.push(options: {})
    all
  end

  class Scope < ApplicationPolicy::Scope
    def resolve
      if user.admin?
        scope.all
      else
        scope.where(user_id: user.id)
      end
    end
  end
end
