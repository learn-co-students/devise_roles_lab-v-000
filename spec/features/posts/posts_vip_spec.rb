require 'rails_helper'

feature 'VIP Post Privileges', :type => :feature do

  before do
    @user = User.create(email: "maily@email.com", password: "passywordy", role: 'vip')
    visit new_user_session_path
    fill_in 'Email', with: @user.email
    fill_in 'Password', with: @user.password
    click_button 'Log in'
  end

  it 'can create a new post' do
    visit new_post_path
    fill_in :post_content, with: "some post content"
    click_button "Create Post"
    expect(page).to have_content("some post content")
  end

  it 'can edit its own post' do
    post = Post.create(content: "some post content", user_id: @user.id)
    visit edit_post_path(post)
    fill_in :post_content, with: "some other post content"
    click_button "Update Post"
    expect(page).to have_content("some other post content")
  end

  it 'can edit posts belonging to other users' do
    new_user = User.create(email: "nonadmin@mail.com", password: "not an admin")
    post = Post.create(content: "some post content", user_id: new_user.id)
    visit edit_post_path(post)
    fill_in :post_content, with: "some other post content"
    click_button "Update Post"
    expect(page).to have_content("some other post content")
  end

  it 'can delete its own post' do
    post = Post.create(content: "some post content", user_id: @user.id)
    visit post_path(post)
    click_button "Delete"
    expect(page).to have_content("Welcome")
  end

  it 'cannot delete posts belonging to other users' do
    new_user = User.create(email: "nonadmin@mail.com", password: "not an admin")
    post = Post.create(content: "some post content", user_id: new_user.id)
    visit post_path(post)
    expect(page).not_to have_button("Delete")
  end
end
