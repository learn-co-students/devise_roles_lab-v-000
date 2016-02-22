require 'rails_helper'

describe 'navigate' do
  before do
    @user = FactoryGirl.create(:user)
    @post = Post.create(title: 'Post 1', content: 'This is a test post', user_id: @user.id)
  end 

  it 'to post pages' do
    visit post_path(@post)
    expect(page.status_code).to eq(200)
  end

  it 'shows the title on the show page in a h1 tag' do
    visit post_path(@post)
    expect(page).to have_css("h1", text: "Post 1")
  end

  it 'shows the content on the show page in a p tag' do
    visit post_path(@post)
    expect(page).to have_css("p", text: "This is a test post")
  end
end
