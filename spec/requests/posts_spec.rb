require 'rails_helper'

RSpec.describe 'Posts', type: :request do
  let!(:user) do
    User.create(
      name: 'Rails',
      photo: 'http://localhost:3000/rrrrrr.png',
      bio: 'Something',
      posts_counter: 10
    )
  end

  let!(:post) do
    Post.create(
      title: 'Ruby',
      text: 'Ruby is awesome',
      author: user,
      comments_counter: 10,
      likes_counter: 10
    )
  end

  describe 'GET /index' do
    before do
      get "/users/#{user.id}/posts/"
    end

    it 'renders post template' do
      expect(response).to render_template(:index)
    end

    it 'post response body includes correct placeholder text' do
      expect(response.body).to include('Posts')
    end
  end

  describe 'GET /show' do
    before do
      get "/users/#{user.id}/posts/#{post.id}"
    end

    it 'returns success for detail post' do
      expect(response).to have_http_status(200)
    end

    it 'renders post detail template' do
      expect(response).to render_template(:show)
    end

    it 'post detail response body includes correct placeholder text' do
      expect(response.body).to include('Comments')
    end
  end
end
