feature 'Post' do
  scenario 'users new post shows up on profile page' do
    user = FactoryGirl.create(:user)
    login_as(user, :scope => :user)
    visit user_path(user)
    expect(page).to have_link("New Post")
    click_link("New Post")
    fill_in 'Content', with: 'I am a new post!'
    click_on "Create Post"
    expect(page).to have_content 'I am a new post!'
    expect(page).to have_link 'user'
  end

  scenario 'users new post shows up as link on post index' do
    user = FactoryGirl.create(:user)
    login_as(user, :scope => :user)
    visit user_path(user)
    click_link("New Post")
    fill_in 'Content', with: 'I am a different post!'
    click_on "Create Post"
    click_on 'All Posts'
    expect(page).to have_link 'I am a different post!'
    expect(page).to have_link 'user'
  end

end
