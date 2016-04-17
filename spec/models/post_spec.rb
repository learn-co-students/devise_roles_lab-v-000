require 'rails_helper'

RSpec.describe Post, type: :model do
  before(:each) {
    Post.destroy_all
    @user = User.create(
      email: 'user@example.com',
      password: "asdfasdf",
      password_confirmation: "asdfasdf"
    )
    @content = "Is this thing on?"
    @new_content = "No seriously, is it?"
    @post = Post.create(user_id:@user.id, content:@content)
  }

  subject { @post }

  # it { should respond_to(:email) }

  it "has content" do
    expect(@post.content).to match(@content)
  end

  it "has an owner" do
    expect(@post.user).to eq @user
  end

  it "can be updated" do
    @post.update(content:@new_content)
    expect(@post.content).to eq @new_content
  end

  it "can be destroyed" do
    prior = Post.count
    @post.destroy
    expect(Post.count).not_to eq(prior)
  end
end
