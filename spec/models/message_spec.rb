require 'rails_helper'

RSpec.describe Message, type: :model do
  before do
    @user = User.create(email:"test@test.com", password:"azerty")
    @chatroom = Chatroom.create
  end

  it "can be saved with valid attributes" do
    @message = Message.new(user: @user, chatroom: @chatroom, content: "This is a message")
    expect(@message).to be_valid
  end

  it "not valid without a user" do
    @message = Message.new(chatroom: @chatroom)
    expect(@message).to_not be_valid
  end

  it "not valid without a chatroom" do
    @message = Message.new(user: @user)
    expect(@message).to_not be_valid
  end

  it "not valid without content" do
    @message = Message.new(user: @user, chatroom: @chatroom)
    expect(@message).to_not be_valid
  end
end
