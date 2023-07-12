class CreateJoinTableUsersChatrooms < ActiveRecord::Migration[7.0]
  def change
    create_join_table :users, :chatrooms do |t|
      t.index [:user_id, :chatroom_id]
      t.index [:chatroom_id, :user_id]
    end
  end
end
