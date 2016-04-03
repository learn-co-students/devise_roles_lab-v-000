require 'rails_helper'

describe "posts", type:  :feature do
  before do
    Post.destroy_all
    User.destroy_all
  end

  it "can edit your own post" do
    user1 = FactoryGirl.create(:user)
    signin(user1.email, user1.password)
    @post1 = user1.posts.build(content: "New Days")
    @post1.save
    visit edit_post_path(@post1)
    page.fill_in :content, :with => 'Old Days'
    click_button('Submit')
    expect(page).to have_content("Old Days")
  end
  
  it "regular 'user' cannot edit another user's post" do
    user1 = FactoryGirl.create(:user)
    user2 = User.create(email: "a@a.com",password: "aaaaaaaaaaaaa")
    signin(user1.email, user1.password)
    @post2 = user2.posts.build(content: "user 2")
    @post2.save
    visit edit_post_path(@post2)
    expect(page).to have_content("Access denied.")
  end

  it "VIP can edit any post" do
    user2 = User.create(email: "a@a.com",password: "aaaaaaaaaaaaa")
    user3 = FactoryGirl.create(:user)
    user3.role = 1
    user3.save
    @post2 = user2.posts.build(content: "user 2")
    @post2.save
    signin(user3.email, user3.password)
    visit edit_post_path(@post2)
    page.fill_in :content, :with => 'Days'
    click_button('Submit')
    expect(page).to have_content("Days")
  end
  
  it "Admin can edit any post" do
    user2 = User.create(email: "a@a.com",password: "aaaaaaaaaaaaa")
    user3 = FactoryGirl.create(:user)
    user3.role = 2
    user3.save
    @post2 = user2.posts.build(content: "user 3")
    @post2.save
    signin(user3.email, user3.password)
    visit edit_post_path(@post2)
    page.fill_in :content, :with => 'Days'
    click_button('Submit')
    expect(page).to have_content("Days")
  end
  


end