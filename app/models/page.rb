class Page < ApplicationRecord
  belongs_to :user

  has_one_attached :avatar
  has_one_attached :background_image
end
