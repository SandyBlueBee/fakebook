class Post < ApplicationRecord
  belongs_to :user
  has_many :comments, dependent: :destroy
  has_many :likes, as: :likeable

  has_one_attached :post_image
  validates :content, presence: { message: "Content can't be blank" }
end
