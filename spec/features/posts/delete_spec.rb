include Warden::Test::Helpers
Warden.test_mode!

# Feature: Delete Post
#   As a user
#   I want to create a post
feature 'Delete post', :devise do

  after(:each) do
    Warden.test_reset!
  end


  scenario 'user can delete their own post' do
    user = FactoryGirl.create(:user)
    login_as(user, :scope => :user)
    post = Post.create(content: 'good stuff', user: user)
    post_id = post.id

    visit post_path(post)
    click_link 'Delete Post'

    expect(page).to_not have_content('good stuff')
    expect(Post.all).to_not include(post)
  end

  scenario "cannot delete a post if not signed in", :me do
    user = FactoryGirl.create(:user)
    login_as(user, :scope => :user)
    post = Post.create(content: 'good stuff', user: user)
    logout(:user)

    visit post_path(post)
    click_link 'Delete Post'

    expect(Post.all).to include(post)
  end

end
