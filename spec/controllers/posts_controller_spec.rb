
describe PostsController do

  context 'normal user' do
    before do
      sign_in!
    end

    it 'allows user to create a post' do
      expect {
        post :create, post: {content: "i love hats"}
      }.to change(Post, :count).by(1)
    end

    it 'does not allow the user to update a post' do
      created_post = create(:post, content: 'bar')

      expect {
        post :update, id: created_post.id, post: { content: 'foo' }
      }.not_to change(created_post, :content)
    end

    it 'does not allow the user to delete a post' do
      created_post = create(:post, content: 'bar')

      expect {
        delete :destroy, id: created_post.id
      }.not_to change(Post, :count)
    end
  end

  context 'vip' do
    before do
      sign_in!('vip')
    end

    it 'allows user to create a post' do
      expect {
        post :create, post: {content: "i love hats"}
      }.to change(Post, :count).by(1)
    end

    it 'can update a post' do
      created_post = create(:post, content: 'bar')

      post :update, id: created_post.id, post: { content: 'foo' }

      expect(created_post.reload.content).to eq('foo')
    end

    it 'does not allow the user to delete a post' do
      created_post = create(:post, content: 'bar')

      expect {
        delete :destroy, id: created_post.id
      }.not_to change(Post, :count)
    end
  end

  context 'admin' do
    before do
      sign_in!('admin')
    end

    it 'allows user to create a post' do
      expect {
        post :create, post: {content: "i love hats"}
      }.to change(Post, :count).by(1)
    end

    it 'allows the user to update a post' do
      created_post = create(:post, content: 'bar')

      post :update, id: created_post.id, post: { content: 'foo' }

      expect(created_post.reload.content).to eq('foo')
    end

    it 'allows the user to delete a post' do
      created_post = create(:post, content: 'bar')

      expect {
        delete :destroy, id: created_post.id
      }.to change(Post, :count).by(-1)
    end
  end
end

# describe PostsController do
#
#   describe '#create' do
#     context 'normal user' do
#       before do
#         sign_in!
#       end
#
#       it 'allows them to create a post' do
#         post = { content: "bar" }
#
#         get new_post_path
#         expect(response).to render_template("new")
#         # expect {
#         #   post posts_path, post
#         # }.to change(Post, :count).by(1)
#       end
#     end
#
#     context 'vip' do
#       before do
#         sign_in!('vip')
#       end
#
#       it 'allows them to create a post' do
#         post = { content: "bar", id: user.id }
#
#         expect {
#           post post_create_path, post
#         }.to change(Post, :count).by(1)
#       end
#     end
#
#     context 'admin' do
#       before do
#         sign_in!('admin')
#       end
#
#       it 'allows them to create a post' do
#         post = { content: "bar", id: user.id }
#
#         expect {
#           post post_create_path, post
#         }.to change(Post, :count).by(1)
#       end
#     end
#   end
#
#
#   describe '#read' do
#     context 'normal user' do
#       before do
#         sign_in!
#       end
#
#       it 'allows them to read a post' do
#         post = Post.first
#
#         expect {
#           get post_path(post)
#         }.to have_content(created_post, :content)
#       end
#     end
#
#     context 'vip' do
#       before do
#         sign_in!('vip')
#       end
#
#       it 'allows them to read a post' do
#         post = Post.first
#
#         expect {
#           get post_path(post)
#         }.to have_content(created_post, :content)
#       end
#     end
#
#     context 'admin' do
#       before do
#         sign_in!('admin')
#       end
#
#       it 'allows them to read a post' do
#         post = Post.first
#
#         expect {
#           get post_path(post)
#         }.to have_content(created_post, :content)
#       end
#     end
#   end
#
#
#   describe '#update' do
#     context 'normal user' do
#       before do
#         sign_in!
#         other_user = User.create
#         other_post = Post.create(content: "bar", user_id: other_user.id)
#       end
#
#       it 'allows them to update a post they own' do
#         created_post = create(:post, content: 'bar')
#
#         expect {
#           post :update, id: created_post.id, post: { content: 'foo' }
#         }.not_to change(created_post, :content)
#       end
#
#       it 'does not allow them to update a post they do not own' do
#         expect {
#           post :update, id: other_post.id, post: { content: 'foo' }
#         }.not_to change(other_post, :content)
#       end
#     end
#
#     context 'vip' do
#       before do
#         sign_in!('vip')
#         other_user = User.create
#         other_post = Post.create(content: "bar", user_id: other_user.id)
#       end
#
#       it 'allows them to update a post they own' do
#         created_post = create(:post, content: 'bar')
#
#         post :update, id: created_post.id, post: { content: 'foo' }
#
#         expect(created_post.reload.content).to eq('foo')
#       end
#
#       it 'allows them to update a post they do not own' do
#         post :update, id: other_post.id, post: { content: 'foo' }
#
#         expect(other_post.reload.content).to eq('foo')
#       end
#     end
#
#     context 'admin' do
#       before do
#         sign_in!('admin')
#         other_user = User.create
#         other_post = Post.create(content: "bar", user_id: other_user.id)
#       end
#
#       it 'allows them to update a post they own' do
#         created_post = create(:post, content: 'bar')
#
#         post :update, id: created_post.id, post: { content: 'foo' }
#
#         expect(created_post.reload.content).to eq('foo')
#       end
#
#       it 'allows them to update a post they do not own' do
#         post :update, id: other_post.id, post: { content: 'foo' }
#
#         expect(other_post.reload.content).to eq('foo')
#       end
#     end
#   end
#
#
#   describe '#delete' do
#     context 'normal user' do
#       before do
#         sign_in!
#         other_user = User.create
#         other_post = Post.create(content: "bar", user_id: other_user.id)
#       end
#
#       it 'allows them to delete a post they own' do
#         post = { content: "bar", id: user.id }
#
#         expect {
#           delete post_path(post), post
#         }.to change(Post, :count).by(-1)
#       end
#
#       it 'does not allow them to delete a post they do not own' do
#         expect {
#           delete post_path(other_post), other_post
#         }.to_not change(Post, :count)
#       end
#     end
#
#     context 'vip' do
#       before do
#         sign_in!('vip')
#         other_user = User.create
#         other_post = Post.create(content: "bar", user_id: other_user.id)
#       end
#
#       it 'allows them to delete a post they own' do
#         post = { content: "bar", id: user.id }
#
#         expect {
#           delete post_path(post), post
#         }.to change(Post, :count).by(-1)
#       end
#
#       it 'allows them to delete a post they do not own' do
#         expect {
#           delete post_path(other_post), other_post
#         }.to change(Post, :count).by(-1)
#       end
#     end
#
#     context 'admin' do
#       before do
#         sign_in!('admin')
#         other_user = User.create
#         other_post = Post.create(content: "bar", user_id: other_user.id)
#       end
#
#       it 'allows them to delete a post they own' do
#         post = { content: "bar", id: user.id }
#
#         expect {
#           delete post_path(post), post
#         }.to change(Post, :count).by(-1)
#       end
#
#       it 'allows them to delete a post they do not own' do
#         expect {
#           delete post_path(other_post), other_post
#         }.to change(Post, :count).by(-1)
#       end
#     end
#   end
# end
