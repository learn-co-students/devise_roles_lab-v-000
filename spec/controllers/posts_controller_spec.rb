describe PostsController do
  describe '#update' do
    context 'neither admin nor vip' do
      before do
        sign_in!
      end

      it 'does not allow the request' do
        created_post = create(:post, content: 'bar')

        expect {
          post :update, id: created_post.id, post: { content: 'foo' }
        }.not_to change(created_post, :content)
      end
    end

    context 'vip' do
      before do
        sign_in!('vip')
      end

      it 'allows the request' do
        created_post = create(:post, content: 'bar')

        post :update, id: created_post.id, post: { content: 'foo' }

        expect(created_post.reload.content).to eq('foo')
      end
    end

    context 'admin' do
      before do
        sign_in!('admin')
      end

      it 'allows the request' do
        created_post = create(:post, content: 'bar')

        post :update, id: created_post.id, post: { content: 'foo' }

        expect(created_post.reload.content).to eq('foo')
      end
    end
  end

  describe '#create' do
    context 'user' do
      before do
        sign_in!
      end
      it 'can create a post' do
        created_post = create(:post, content: 'william')

        expect(Post.last).to eql created_post
      end
    end

    context 'vip' do
      before do
        sign_in!('vip')
      end
      it 'can create a post' do
        created_post = create(:post, content: 'william')

        expect(Post.last).to eql created_post
      end
    end

    context 'admin' do
      before do
        sign_in!('admin')
      end
      it 'can create a post' do
        created_post = create(:post, content: 'william')

        expect(Post.last).to eql created_post
      end
    end
  end

  describe 'Edit and Delete Posts' do
    context 'user' do
      before do
        sign_in!
      end
      it 'can edit their own posts' do
        created_post = create(:post, content: 'william is amazing.')

        post :update, id: created_post.id, post: { content: 'foo' }
        expect(created_post.reload.content).to eq('foo')
      end
      it 'can delete their own posts' do
        created_post = create(:post, content: 'william is amazing.')

        # post :destroy, id: created_post.id
        # expect(created_post.reload.content).to eq(nil)
        expect{
          post :destroy, id: created_post.id
          }.to change(Post, :count).by(-1)
      end
    end
    context 'vip' do
      before do
        sign_in!('vip')
      end
      it 'can edit their own posts' do
        created_post = create(:post, content: 'william is amazing.')

        post :update, id: created_post.id, post: { content: 'foo' }
        expect(created_post.reload.content).to eq('foo')
      end
      it 'can delete their own posts' do
        created_post = create(:post, content: 'william is amazing.')

        # post :destroy, id: created_post.id
        # expect(created_post.reload.content).to eq(nil)
        expect{
          post :destroy, id: created_post.id
          }.to change(Post, :count).by(-1)
      end
    end
    context 'admin' do
      before do
        sign_in!('admin')
      end
      it 'can edit their own posts' do
        created_post = create(:post, content: 'william is amazing.')

        post :update, id: created_post.id, post: { content: 'foo' }
        expect(created_post.reload.content).to eq('foo')
      end
      it 'can delete their own posts' do
        created_post = create(:post, content: 'william is amazing.')

        # post :destroy, id: created_post.id
        # expect(created_post.reload.content).to eq(nil)
        expect{
          post :destroy, id: created_post.id
          }.to change(Post, :count).by(-1)
      end
    end
  end


end

