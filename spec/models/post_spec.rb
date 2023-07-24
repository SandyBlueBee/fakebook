require 'rails_helper'

RSpec.describe Post, type: :model do
  before do
    @user = User.create(email:"test@test.com", password:"azerty")
    @post = Post.new(content: "This is a text post content", user: @user)
  end

  it "can be saved with valid attributes" do
    expect(@post).to be_valid
  end

  it "is not valid without content" do
    contentless_post = Post.new(user: User.first)
    expect(contentless_post).to_not be_valid
  end

  it "is not valid without a user" do
    userless_post = Post.new(content: "This is a text post content")
    expect(userless_post).to_not be_valid
  end

  # describe "section added" do
  #   context "context for section" do
  #     it "can run tests" do
  #       expect(false).to be(true)
  #     end
  #   end
  # end
end
