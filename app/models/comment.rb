class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :post
  has_many :likes, as: :likeable
  has_one_attached :comment_image

  validates :content, presence: { message: "Content can't be blank" }
end
