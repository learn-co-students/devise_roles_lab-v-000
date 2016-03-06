require 'rails_helper'

RSpec.describe Post, type: :model do
	before(:all) { 
		@post = Post.create(title: "New Post", description: "Post Description")
		@user = User.create(email: 'user@example.com', password: "testpass", password_confirmation: "testpass")
	}
	
	
	it 'has a title' do
		expect(@post.title).to eq("New Post")
	end

	it 'has a description' do
		expect(@post.description).to eq("Post Description")
	end

	it 'has an owner' do
		@post.owner = @user
		@post.save
		expect(@post.owner).to eq(@user)
	end

end
	

