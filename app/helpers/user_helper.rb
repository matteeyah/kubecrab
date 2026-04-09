require "digest"

module UserHelper
  def user_avatar(classes, user: current_user)
    if user.avatar.attached?
      image_tag user.avatar, class: "#{classes} rounded-full"
    else
      heroicon "user-circle", variant: :solid, options: { class: "#{classes} text-gray-300 dark:text-gray-500 rounded-full" }
    end
  end
end
