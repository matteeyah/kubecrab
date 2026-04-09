class Crab < ApplicationRecord
  belongs_to :template
  belongs_to :user

  serialize :options, coder: JSON

  enum :status, { creating: 0, running: 1, updating: 2, error: 3, stopped: 4, deleting: 5 }

  validates :name, presence: true
end
