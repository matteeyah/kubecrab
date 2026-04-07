class Engine < ApplicationRecord
  validates :name, presence: true, uniqueness: true
  validates :deploy_command, presence: true
  validates :status_command, presence: true
  validates :update_command, presence: true
  validates :restart_command, presence: true
  validates :destroy_command, presence: true

  has_many :templates, dependent: :destroy
end
