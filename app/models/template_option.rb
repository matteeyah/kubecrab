class TemplateOption < ApplicationRecord
  belongs_to :template

  validates :name, presence: true, uniqueness: { scope: :template_id }
end
