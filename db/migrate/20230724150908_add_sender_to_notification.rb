class AddSenderToNotification < ActiveRecord::Migration[7.0]
  def change
    add_reference :notifications, :sender, foreign_key: { to_table: :users }
  end
end
