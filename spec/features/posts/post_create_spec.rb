require 'rails_helper'

describe "posts", type:  :feature do
  before do
    Post.destroy_all
    User.destroy_all
    user = FactoryGirl.create(:user)
    signin(user.email, user.password)
  end

  it "can create a new post" do
    visit new_post_path
    page.fill_in :content, :with => 'My New House'
    click_button('Submit')
    expect(page).to have_content("My New House")
  end
end
