include Warden::Test::Helpers
Warden.test_mode!

# Feature: Show Post
#   As a user
#   I want to see a post
feature 'Show post', :devise do

  after(:each) do
    Warden.test_reset!
  end


  scenario 'user can a post' do
    user = FactoryGirl.create(:user)
    post = Post.create(content: 'good stuff', user: user)

    visit post_path(post)
    expect(page).to have_content('good stuff')
  end

  scenario "can see a post if not signed in", :me do
    user = FactoryGirl.create(:user)
    post = Post.create(content: 'good stuff', user: user)
    logout(:user)
    visit post_path(post)
    expect(page).to have_content('good stuff')
  end

end
