include Warden::Test::Helpers
Warden.test_mode!

# Feature: Create Post
#   As a user
#   I want to create a post
feature 'Edit post', :devise do

  after(:each) do
    Warden.test_reset!
  end


  scenario 'user can edit their own post' do
    user = FactoryGirl.create(:user)
    login_as(user, :scope => :user)
    post = Post.create(content: 'good stuff')
    post.user = user
    post.save
    visit edit_post_path(post)
    fill_in 'Content', :with => 'better stuff'
    click_button 'Update Post'

    expect(page).to have_content('better stuff')
  end

  scenario "cannot edit a post if not signed in", :me do
    user = FactoryGirl.create(:user)
    post = Post.create(content: 'good stuff', user: user)
    logout(:user)
    visit edit_post_path(post)
    fill_in 'Content', :with => 'annoymous hacker'
    click_button 'Update Post'
    expect(page).to_not have_content('annoymous hacker')
  end

end
