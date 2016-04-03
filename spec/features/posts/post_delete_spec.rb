require 'rails_helper'

describe "posts", type:  :feature do
  before do
    Post.destroy_all
    User.destroy_all
  end

  it "can delete your own post" do
    user1 = FactoryGirl.create(:user)
    signin(user1.email, user1.password)
    @post1 = user1.posts.build(content: "New Days")
    @post1.save
    visit post_path(@post1)
    click_link('Delete')
    expect(page).to have_content("Sucessfully Deleted")
  end
 
  it "regular 'user' cannot delete another user's post" do
    user1 = FactoryGirl.create(:user)
    user2 = User.create(email: "a@a.com",password: "aaaaaaaaaaaaa")
    signin(user1.email, user1.password)
    @post2 = user2.posts.build(content: "user 2")
    @post2.save
    visit post_path(@post2)
    click_link('Delete')
    expect(page).to have_content("Not Allowed to delete.")
  end

  it "VIP can edit any post" do
    user2 = User.create(email: "a@a.com",password: "aaaaaaaaaaaaa")
    user3 = FactoryGirl.create(:user)
    user3.role = 1
    user3.save
    @post2 = user2.posts.build(content: "user 2")
    @post2.save
    signin(user3.email, user3.password)
    visit post_path(@post2)
    click_link("Delete")
    expect(page).to have_content("Sucessfully Deleted")
  end
  
  it "Admin can edit any post" do
    user2 = User.create(email: "a@a.com",password: "aaaaaaaaaaaaa")
    user3 = FactoryGirl.create(:user)
    user3.role = 2
    user3.save
    @post2 = user2.posts.build(content: "user 3")
    @post2.save
    signin(user3.email, user3.password)
    visit post_path(@post2)
    click_link("Delete")
    expect(page).to have_content("Sucessfully Deleted")
  end
 
end