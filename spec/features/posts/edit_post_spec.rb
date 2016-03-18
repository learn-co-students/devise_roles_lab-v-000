feature 'Edit post' do
  scenario 'successfully' do
    user = FactoryGirl.create(:user)
    post = FactoryGirl.create(:post)
    post.user = user

    visit new_user_session_path
    post 'Email', with: user.email
    fill_in 'Password', with: user.password
    click_button 'Log in'

    visit edit_post_path(post)
    save_and_open_page
    fill_in 'Content', with: 'This is even more amazing content'
    click_button 'Update Post'
    expect(page).to have_content('This is even more amazing content')
  end

end
