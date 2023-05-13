require 'rails_helper'

RSpec.describe Comment, type: :model do
  user = User.new(name: 'Something',
                  photo: 'http://rrrrrr/something.jpg',
                  bio: 'Something test',
                  posts_counter: 0)
  post = Post.new(
    title: 'Something',
    text: 'Something test',
    author: user,
    comments_counter: 0,
    likes_counter: 0
  )

  subject(:comment) do
    Comment.new(text: 'TEst comments',
                author: user,
                post: post)
  end

  it 'is valid with valid attributes' do
    expect(comment).to be_valid
  end
  it 'it is  valid without a comment' do
    comment.text = nil
    expect(comment).to be_valid
  end

  it 'it should update post comment counter' do
    comment.save
    expect(post.comments_counter).to eq(2)
  end
end
