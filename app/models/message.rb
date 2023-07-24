class Message < ApplicationRecord
  belongs_to :chatroom
  belongs_to :user
  has_one_attached :message_image

  validates :content, presence: { message: "Content can't be blank" }
end
