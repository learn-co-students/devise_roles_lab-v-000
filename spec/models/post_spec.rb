require 'rails_helper'

describe Post do
  it 'belongs to a user' do
    expect(Post.new).to respond_to(:user)
  end

  it 'must have content' do
  	created_post = Post.new
  	created_post.content = ''
  	created_post.valid?
  	expect(created_post.errors[:content]).to include("can't be blank")
  end	
end
