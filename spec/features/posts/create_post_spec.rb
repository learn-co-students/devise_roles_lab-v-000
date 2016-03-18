feature 'Create post' do
  scenario 'successfully' do
    visit new_user_session_path
    user = FactoryGirl.create(:user)
    fill_in 'Email', with: user.email
    fill_in 'Password', with: user.password
    click_button 'Log in'

    visit new_post_path
    fill_in 'Content', with: 'This is some amazing content'
    click_button 'Create Post'
    expect(page).to have_content('This is some amazing content')
  end

  scenario 'unlogged in user cannot create post' do
    visit new_post_path
    expect(page).to have_content('You need to sign in or sign up before continuing.')
  end
end
