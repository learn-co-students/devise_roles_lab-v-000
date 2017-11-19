require 'rails_helper'

describe Post do
  before(:each) do
    @user = User.new(email: 'user@example.com')
    @post = Post.new(content: "interesting content", user_id: @user.id)
  end

  it 'belongs to a user' do
    expect(Post.new).to respond_to(:user)
  end

  it "has content" do
    expect(@post.content).to eq("interesting content")
  end
end
