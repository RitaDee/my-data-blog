require 'rails_helper'

RSpec.describe Like, type: :model do
  user = User.create(name: 'Something',
                     photo: 'http://rrrrrrrr/something.jpg',
                     bio: 'Something test',
                     posts_counter: 0)
  post = Post.create(
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

  it 'updates post likes_counter' do
    subject.save
    expect(post.likes_counter).to eq 1
  end
end
