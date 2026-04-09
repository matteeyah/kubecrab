class Engine < ApplicationRecord
  validates :name, presence: true, uniqueness: true
  validates :deploy_command, presence: true
  validates :status_command, presence: true
  validates :upgrade_command, presence: true
  validates :restart_command, presence: true
  validates :destroy_command, presence: true

  has_many :templates, dependent: :destroy
end
