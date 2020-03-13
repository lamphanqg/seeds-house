class Species < ApplicationRecord
  belongs_to :family
  has_many :seeds, dependent: :destroy

  validates :name, presence: true

  def name_with_family_name
    joins(:family).select("species.id, CONCAT (species.name, ' - ', families.name) as name")
  end
end
