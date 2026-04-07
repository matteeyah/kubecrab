class ProfileController < ApplicationController
  skip_after_action :verify_authorized

  def show; end

  def update
    respond_to do |format|
      if current_user.update(permitted_attributes(current_user))
        format.html { redirect_to profile_path, notice: "Your profile has been updated." }
      else
        format.html { render :show, status: :unprocessable_content }
      end
    end
  end

  def destroy
    current_user.destroy!
    redirect_to root_path
  end
end
