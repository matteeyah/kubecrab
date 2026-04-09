# frozen_string_literal: true

class ApplicationJobPolicy < ApplicationPolicy
  def index?
    user.admin?
  end

  class Scope < ApplicationPolicy::Scope
    def resolve
      scope.all
    end
  end
end
