class Message < ApplicationRecord
  belongs_to :chatroom
  belongs_to :user

  validates :content, presence: { message: "Content can't be blank" }
end
