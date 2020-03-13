class Seed < ApplicationRecord
  belongs_to :species
  has_one_attached :image1
  has_one_attached :image2
  has_one_attached :image3

  def images
    [:image1, :image2, :image3].map do |image|
      image_obj = send(image)
      image_obj if image_obj.attached?
    end.compact
  end
end
