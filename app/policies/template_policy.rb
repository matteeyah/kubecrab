# frozen_string_literal: true

class TemplatePolicy < ApplicationPolicy
  def permitted_attributes
    %i[name avatar description instruction template status engine_id]
  end

  class Scope < ApplicationPolicy::Scope
    def resolve
      if user.admin?
        scope.all
      else
        scope.none
      end
    end
  end
end
