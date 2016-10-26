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

  describe '#destroy' do
    let!(:user) { FactoryGirl.create(:user) }
    let!(:post) { FactoryGirl.create(:post) }

    context 'neither admin nor vip' do

      before do
        sign_in!
      end

      it 'does not allow the request' do
        expect {
          delete :destroy, id: post.id
        }.not_to change(Post, :count)
      end
    end

    context 'vip' do

      before do
        sign_in!('vip')
      end

      it 'does not allow the request' do
        expect {
          delete :destroy, id: post.id
        }.not_to change(Post, :count)
      end
    end

    context 'admin' do

      before do
        sign_in!('admin')
      end

      it 'allows the request' do
        expect {
          delete :destroy, id: user.id
        }.to change(Post, :count).by(-1)
      end
    end
  end
end
