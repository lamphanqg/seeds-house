class Family < ApplicationRecord
  has_many :species, dependent: :destroy

  validates :name, presence: true
end
