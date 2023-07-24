require "test_helper"

class PostTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
  puts "Post validations"
  test "Post should not save without content" do
    user = User.create(first_name: "François", last_name: "Robino", email:"francois@test.com", password: "azerty")
    post = Post.new(user_id: user.id)
    assert_not post.save
  end

  test "Post should save with content" do
    user = User.create(first_name: "François", last_name: "Robino", email:"francois@test.com", password: "azerty")
    post = Post.new(content: "Testing", user_id: user.id)
    assert post.save
  end
end
