require 'rails_helper'

describe Post do
  before(:each) {@post = Post.new(content: "Testing content here.")}
  it 'belongs to a user' do
    expect(Post.new).to respond_to(:user)
  end

  it 'has content' do
    expect(@post.content).to eq 'Testing content here.'
  end

end
