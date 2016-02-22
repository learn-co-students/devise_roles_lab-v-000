require 'rails_helper'

RSpec.describe Post, type: :model do
  before do
    @user = FactoryGirl.create(:user)
    @post = Post.create!(title: 'Post 1', content: 'This is a test post', user_id: @user.id)
  end 

  it "#belongs to a user" do
    expect(@post.user).to eq @user
  end 

  it "#user has the correct number of posts" do
    expect(@user.posts.count).to eq 1
  end

  it "#post has a title" do
    expect(@post.title).to eq "Post 1"
  end

  it "#post has content" do
    expect(@post.content).to eq "This is a test post"
  end
end