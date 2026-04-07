module Admin
  class UsersController < ApplicationController
    def index
      @users = authorize(policy_scope(User))
    end
  end
end
