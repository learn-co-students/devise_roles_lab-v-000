require 'rails_helper'

describe Post do
  before(:each) do
    @user = FactoryGirl.create(:user)
    @post = FactoryGirl.create(:post)
  end

  subject { @post }

  it 'belongs to a user' do
    expect(@post).to respond_to(:user)
  end

  it 'has a #content getter method' do
    expect(@post).to respond_to(:content)
  end

  it '#content returns a string' do
    expect(@post.content).to match('content')
  end
end
