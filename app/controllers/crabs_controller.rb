class CrabsController < ApplicationController
  def index
    @crabs = authorize(policy_scope(User))
  end
end
