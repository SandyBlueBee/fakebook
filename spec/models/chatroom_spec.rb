require 'rails_helper'

RSpec.describe Chatroom, type: :model do
  it 'can be saved with valid attributes' do
    @chatroom = Chatroom.new
    expect(@chatroom).to be_valid
  end
end
