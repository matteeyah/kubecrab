require "digest"

module UserHelper
  def user_avatar
    hash = Digest::SHA256.hexdigest(current_user.email)

    "https://www.gravatar.com/avatar/#{hash}?s=100&d=retro"
  end
end
