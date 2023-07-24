class Notification < ApplicationRecord
  include Noticed::Model
  belongs_to :recipient, polymorphic: true
  belongs_to :sender, class_name: 'User', foreign_key: 'sender_id', optional: true
end
