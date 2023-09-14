class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :posts, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :likes, dependent: :destroy
  has_many :messages, dependent: :destroy
  has_many :pages, dependent: :destroy
  has_and_belongs_to_many :chatrooms
  has_one_attached :avatar
  has_one_attached :background_image
  has_many :notifications, as: :recipient, dependent: :destroy

  def online?
    updated_at > 2.minutes.ago
  end
  # validates :email, presence: true
end
