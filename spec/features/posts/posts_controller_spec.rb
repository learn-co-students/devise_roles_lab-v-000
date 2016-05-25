require 'rails_helper'
include Warden::Test::Helpers
Warden.test_mode!

feature 'Posts index', :devise do

  before(:each) do
    @user= FactoryGirl.create(:user)
  end

  after(:each) do
    Warden.test_reset!
  end

  scenario 'Users of all kinds can see all posts' do

    posts=10.times{Post.create(content: "post")}
    login_as(@user)
    visit posts_path
    expect(page.body).to have_content 'post'
  end

  scenario 'Users who are logged in can create posts' do
    login_as(@user)
    visit new_user_post_path(@user)
    fill_in "post[content]", :with=> "test"
    click_on "Create Post"
    expect(page.body).to include('Posts Index')

  end

  scenario "Users who aren't logged in can't see shit" do
    visit posts_path
    expect(page.body).to include('Sign in')
  end


end