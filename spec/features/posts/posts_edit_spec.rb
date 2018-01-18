include Warden::Test::Helpers
Warden.test_mode!

feature 'Post edit', :devise do

  after(:each) do
    Warden.test_reset!
  end

  # scenario 'user can change content on their own post' do
  #   user = FactoryGirl.create(:user)
  #   login_as(user, :scope => :user)
  #   created_post = create(:post, content: 'bar')
  #   visit post_path(created_post)
  #   expect(page).to have_content('Edit')
  # end
  #
  # scenario "user cannot cannot edit another user's post" do
  #   post = create(:post, subject: "Nice", content: "Woah!")
  #   visit post_path(post)
  #   expect(page).not_to have_content('Edit')
  # end
  #
  # scenario "admin can edit another user's post" do
  #   user = create(:user, email: "test3@test.com", password: "testtest")
  #   post = create(:post, subject: "Nice", content: "Woah!", user_id: "#{user.id}")
  #   login_as "An Admin", :scope => :admin
  #   visit post_path(post)
  #   expect(page).to have_content("Edit")
  # end

end
