require 'rails_helper'

RSpec.describe Post, type: :model do
  before(:each) { @post = Post.new(content: 'This is a test post')}

  subject { @post }

  it { should respond_to(:content) }

  it 'belongs to a user' do
    expect(Post.new).to respond_to(:user)
  end


end
