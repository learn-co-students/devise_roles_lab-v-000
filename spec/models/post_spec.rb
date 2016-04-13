require 'rails_helper'

RSpec.describe Post, type: :model do
  before(:each) do 
    @post=FactoryGirl.create(:post)
  end

  subject { @post }

  it "is invalid if empty" do 
    post=Post.new
    expect(post.save).to be false

  end


end

