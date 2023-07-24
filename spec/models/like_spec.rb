require 'rails_helper'

RSpec.describe Like, type: :model do
  before do
    @user = User.create(email:"test@test.com", password:"azerty")
    @post = Post.create(content: "This is a text post content", user: @user)
  end

  it "can be saved with valid attributes" do
    @like = Like.new(user: @user,likeable_type: "Post", likeable_id: @post.id)
    expect(@like).to be_valid
  end

  it "is not valid without a user" do
    @like = Like.new(likeable_type: "Post", likeable_id: @post.id)
    expect(@like).to_not be_valid
  end

  it "is not valid without a likeable type" do
    @like = Like.new(user: @user)
    expect(@like).to_not be_valid
  end
end
