include Warden::Test::Helpers
Warden.test_mode!

feature 'Post show page', :devise do

  after(:each) do
    Warden.test_reset!
  end

  scenario 'anyone can see post show page' do
    user = FactoryGirl.create(:user)
    login_as(user, :scope => :user)
    created_post = create(:post, content: 'bar')
    logout(user, :scope => :user)
    visit post_path(Post.last)
    expect(page).to have_content 'bar'
  end



end
