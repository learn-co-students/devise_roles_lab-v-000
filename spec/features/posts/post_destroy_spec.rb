include Warden::Test::Helpers
Warden.test_mode!


feature 'Post destroy', :devise do

  after(:each) do
    Warden.test_reset!
  end

  scenario 'user can destroy their own post' do
    user = FactoryGirl.create(:user, role: 'user')
    login_as(user, :scope => :user)
    post = FactoryGirl.create(:post)

    visit post_path(post)
    click_link 'Destroy Post'

    expect(Post.all.count).to be == 0
  end

  scenario 'user cant destroy other users posts' do
    user = FactoryGirl.create(:user, role: 'user')
    user2 = FactoryGirl.create(:user, email: 'other@exammple.com', role: 'user')
    post = FactoryGirl.create(:post)
    login_as(user2, :scope => :user)

    visit post_path(post)
    click_link 'Destroy Post'

    expect(Post.all.count).to be == 1
  end

  scenario 'admins can destroy other users posts' do
    user = FactoryGirl.create(:user, role: 'user')
    admin = FactoryGirl.create(:user, email: 'other@exammple.com', role: 'admin')
    post = FactoryGirl.create(:post)
    login_as(admin, :scope => :user)

    visit post_path(post)
    click_link 'Destroy Post'

    expect(Post.all.count).to be == 0
  end

  scenario 'vips can destroy other users posts' do
    user = FactoryGirl.create(:user, role: 'user')
    vip = FactoryGirl.create(:user, email: 'other@exammple.com', role: 'vip')
    post = FactoryGirl.create(:post)
    login_as(vip, :scope => :user)

    visit post_path(post)
    click_link 'Destroy Post'

    expect(Post.all.count).to be == 0
  end


end