# frozen_string_literal: true

class EnginePolicy < ApplicationPolicy
  def permitted_attributes
    %i[name deploy_command status_command upgrade_command restart_command destroy_command]
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
