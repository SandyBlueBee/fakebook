require 'rails_helper'

RSpec.describe Comment, type: :model do
  before do
    @user = User.create(email:'test@test.com', password:'azerty')
    @post = Post.create(content: 'This is a text post content', user: @user)
  end

  it 'can be saved with valid attributes' do
    @comment = Comment.new(user: @user, post: @post, content: 'This is a comment')
    expect(@comment).to be_valid
  end

  it 'is not valid without a user' do
    @comment = Comment.new(post: @post, content: 'This is a comment')
    expect(@comment).to_not be_valid
  end

  it 'is not valid without a post' do
    @comment = Comment.new(user: @user, content: 'This is a comment')
    expect(@comment).to_not be_valid
  end

  it 'is not valid without content' do
    @comment = Comment.new(user: @user, post: @post)
    expect(@comment).to_not be_valid
  end

  # needs content
end
