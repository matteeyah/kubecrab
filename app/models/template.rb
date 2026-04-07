class Template < ApplicationRecord
  belongs_to :engine

  has_many :template_options, dependent: :destroy

  has_many :crabs, dependent: :destroy

  enum :status, { active: 0, disabled: 1 }

  has_one_attached :avatar

  validates :name, presence: true, uniqueness: true
end
