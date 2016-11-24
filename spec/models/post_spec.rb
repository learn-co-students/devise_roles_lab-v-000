require 'rails_helper'

RSpec.describe Post, type: :model do
  before(:each) {
    @user = User.new(email: 'user@example.com')
    @post = Post.new(title: 'The Queaies', content: "I have them", user_id: 1)
  }

  subject { @post }

  it { should respond_to(:title) }

  it "#title returns a string" do
    expect(@post.title).to match 'The Queaies'
  end

  it "#content returns a string" do
    expect(@post.content).to match 'I have them'
  end


  it 'belongs to a user' do
    expect(Post.new).to respond_to(:user)
  end
end
