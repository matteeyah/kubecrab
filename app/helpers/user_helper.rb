require "digest"

module UserHelper
  def user_avatar(classes)
    if current_user.avatar.attached?
      image_tag current_user.avatar, class: "#{classes} rounded-full"
    else
      heroicon "user-circle", variant: :solid, options: { class: "#{classes} text-gray-300 dark:text-gray-500 rounded-full" }
    end
  end
end
