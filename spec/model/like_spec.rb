require 'rails_helper'

RSpec.describe Like, type: :model do
  user = User.new(name: 'Something',
                  photo: 'http://localhost:3000/something.jpg',
                  bio: 'Something test',
                  posts_counter: 0)
  post = Post.new(
    title: 'Something',
    text: 'Something test',
    author: user,
    comments_counter: 0,
    likes_counter: 0
  )
  subject do
    described_class.new(
      author: user,
      post: post
    )
  end
  it 'is valid with valid attributes' do
    expect(subject).to be_valid
  end
end
