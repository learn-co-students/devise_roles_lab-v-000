require 'rails_helper'

describe Post do
  it 'belongs to a user' do
    expect(Post.new).to respond_to(:user)
  end


  before(:each) { @post = Post.new(content: 'Here is my new awesome post!')}

  subject { @post }

  it { should respond_to(:content) }

  it "#content returns a string" do
    expect(@post.content).to match 'Here is my new awesome post!'
  end
end

