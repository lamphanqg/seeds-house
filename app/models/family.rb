class Family < ApplicationRecord
  has_many :species

  validates :name, presence: true
end
