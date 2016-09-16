# == Schema Information
#
# Table name: posts
#
#  id         :integer          not null, primary key
#  user_id    :integer
#  content    :text
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

require 'rails_helper'

describe Post do
  it 'belongs to a user' do
    expect(Post.new).to respond_to(:user)
  end
end
