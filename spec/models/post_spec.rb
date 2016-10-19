require 'rails_helper'

describe Post do
  it 'belongs to a user' do
    expect(Post.new).to respond_to(:user)
  end
end

RSpec.describe Post, type: :model do
  before(:each) { 
    @user = User.new(email: 'user@example.com')
    @post = Post.new(content: 'some content', user_id: @user.id)
  }

  subject { @post }

  it { should respond_to(:content) }
  it { should respond_to(:user_id) }

end