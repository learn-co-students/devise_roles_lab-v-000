include Warden::Test::Helpers
Warden.test_mode!


feature 'Post edit', :devise do

  after(:each) do
    Warden.test_reset!
  end

  scenario 'user can edit their own post' do
    user = FactoryGirl.create(:user, role: 'user')
    login_as(user, :scope => :user)
    post = FactoryGirl.create(:post)
    visit edit_post_path(post)
    fill_in 'Content', :with => 'new content'
    click_button 'Update'
    expect(page).to have_content('new content')
  end

  scenario 'user cannot edit a post that they do not own' do
    user = FactoryGirl.create(:user)
    user2 = FactoryGirl.create(:user, email: 'other@exammple.com', role: 'user')
    login_as(user2, :scope => :user)
    post = FactoryGirl.create(:post)
    post.user_id = 1
    post.save
    visit edit_post_path(post)
    fill_in 'Content', :with => 'new content'
    click_button 'Update'
    expect(page).to have_content('error')
  end

  scenario 'admin can edit a post that they do not own' do
    admin = FactoryGirl.create(:user, role: 'admin')
    user = FactoryGirl.create(:user, email: 'other@exammple.com', role: 'user')
    login_as(admin, :scope => :user)
    post = FactoryGirl.create(:post)
    post.user_id = 2
    post.save
    visit edit_post_path(post)
    fill_in 'Content', :with => 'new content'
    click_button 'Update'
    expect(page).to have_content('new content')
  end

  scenario 'vip can edit a post that they do not own' do
    admin = FactoryGirl.create(:user)
    vip = FactoryGirl.create(:user, email: 'other@exammple.com', role: 'vip')
    login_as(vip, :scope => :user)
    post = FactoryGirl.create(:post)
    post.user_id = 1
    post.save
    visit edit_post_path(post)
    fill_in 'Content', :with => 'new content'
    click_button 'Update'
    expect(page).to have_content('new content')
  end

end