class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  enum :role, { guest: 0, member: 1, editor: 2, manager: 3, admin: 4 }

  def display_name
    return name if name.present?

    email.split("@").first.titleize
  end
end
