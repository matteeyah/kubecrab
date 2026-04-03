class ApplicationController < ActionController::Base
  include Pundit::Authorization

  # Only allow modern browsers supporting webp images, web push, badges, import maps, CSS nesting, and CSS :has.
  allow_browser versions: :modern

  before_action :authenticate_user!, unless: :devise_controller?
  after_action :verify_authorized, unless: :devise_controller?

  layout :set_layout

  private

  def set_layout
    if user_signed_in?
      "application"
    else
      "devise"
    end
  end
end
