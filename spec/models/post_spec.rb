require 'rails_helper'

describe Post do
  it 'belongs to a user' do
    expect(Post.new).to respond_to(:user)
  end

  it 'has content' do
    post_content = {:content => "I love posting"}
    post = Post.new(post_content)

    expect(post.content).to eq(post_content[:content])
  end

  describe 'knows about its associations' do
    it 'knows its user\'s email address' do
      user = User.create(name: 'Hannah', email: 'h@annah.com', password: 'ilovehatsandmops')
      post = user.posts.create(content: 'mops are best')

      expect(post.user.email).to eq(user.email)
    end

    it 'knows its user\'s role' do
      user = User.create(name: 'Hannah', email: 'h@annah.com', password: 'ilovehatsandmops')
      post = user.posts.create(content: 'mops are best')

      expect(post.user.role).to eq(user.role)
    end

    it 'knows its user\'s name' do
      user = User.create(name: 'Hannah', email: 'h@annah.com', password: 'ilovehatsandmops')
      post = user.posts.create(content: 'mops are best')

      expect(post.user.name).to eq(user.name)
    end
  end
end
