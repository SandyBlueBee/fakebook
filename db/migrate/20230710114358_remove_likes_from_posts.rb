class RemoveLikesFromPosts < ActiveRecord::Migration[7.0]
  def change
    remove_column :posts, :likes, :integer
  end
end
