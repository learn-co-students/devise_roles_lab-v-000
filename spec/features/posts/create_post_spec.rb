require 'rails_helper'

feature 'Create New Post', :type => :feature do
  it 'must be logged in to view form' do
    visit new_post_path
    expect(page).to have_content("Welcome")
  end
end
