include Warden::Test::Helpers
Warden.test_mode!

# Feature: Create Post
#   As a user
#   I want to create a post
feature 'Create post', :devise do

  after(:each) do
    Warden.test_reset!
  end


  scenario 'user can create post' do
    user = FactoryGirl.create(:user)
    login_as(user, :scope => :user)
    visit new_post_path
    fill_in 'Content', :with => 'my new content'
    click_button 'Create Post'

    expect(page).to have_content('my new content')
  end

  scenario "cannot create a post if not signed in", :me do
    visit new_post_path
    fill_in 'Content', :with => 'my new content'
    click_button 'Create Post'
    expect(page).to_not have_content('my new content')
  end

end
