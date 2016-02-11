require 'rails_helper'

RSpec.describe Post, type: :model do
  before(:each) do
    @user = User.new(email: 'user@example.com')
    @post = Post.new(content: 'test test test content')
    @post.user = @user
  end

  subject { @post }

  it { should respond_to(:content) }

  it "#content returns a string" do
    expect(@post.content).to match 'test test test content'
  end

  it "can have a user" do
    expect(@post.user).to eq @user#:user
  end

end
