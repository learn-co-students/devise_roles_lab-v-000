require 'rails_helper'

RSpec.describe Post, type: :model do
  before do
    @user = FactoryGirl.create(:user)
    @post = Post.create(title: "Kittens", content: "Kittens landed on Earth.")
  end

  it 'has a title' do 
    expect(@post.title).to eq "Kittens"
  end

  it 'has content' do
    expect(@post.content).to eq "Kittens landed on Earth."
  end

end
