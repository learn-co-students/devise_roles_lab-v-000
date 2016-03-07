include Warden::Test::Helpers
Warden.test_mode!


feature 'Post create', :devise do

  after(:each) do
    Warden.test_reset!
  end

  scenario 'user can create a post' do
    user = FactoryGirl.create(:user, role: 'user')
    login_as(user, :scope => :user)
    visit new_post_path
    fill_in 'Content', :with => 'new content'
    click_button 'Create Post'
    expect(page).to have_content('new content')
  end

end