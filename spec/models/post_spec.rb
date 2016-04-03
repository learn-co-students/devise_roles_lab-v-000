require 'rails_helper'

RSpec.describe Post, type: :model do
  before(:each) { @post = Post.new(content: 'Content') }

  subject { @post }

  it { should respond_to(:content) }

  it "#content returns a string" do
    expect(@post.content).to match 'Content'
  end

  it "#has a user" do
    @user = User.create(email: "a@a.com")
    @post.user_id = @user.id 
    expect(@post.user_id).to eq @user.id
  end

end
