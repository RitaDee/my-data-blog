require 'rails_helper'

RSpec.describe Post, type: :model do

  let(:user) do
    User.create(name: 'Anything', photo: 'http://rrrrrrrr/anything.jpg', bio: 'Anything test', posts_counter: 0)
  end

  let(:post) do
    Post.create(author: user, title: 'Hello', text: 'This is my first post')
  end

  subject(:subject_post) do
    described_class.new(
      title: 'Hello',
      text: 'This is my first post',
      author: user,
      comments_counter: 0,
      likes_counter: 0
    )
  end

  it 'is valid with valid attributes' do
    expect(subject_post).to be_valid
  end

  it 'is not valid without a title' do
    subject_post.title = nil
    expect(subject_post).to_not be_valid
  end

  it 'is not valid with a length for title more than 250' do
    title = ''
    title += 'a' while title.length < 251
    subject_post.title = title
    expect(subject_post).to_not be_valid
  end

  it 'is not valid with negative number for comments counter' do
    subject_post.comments_counter = -1
    expect(subject_post).to_not be_valid
  end

  it 'is not valid with string for comments counter' do
    subject_post.comments_counter = 'string'
    expect(subject_post).to_not be_valid
  end

  it 'is not valid with negative number for likes counter' do
    subject_post.likes_counter = -1
    expect(subject_post).to_not be_valid
  end

  it 'is not valid with string for likes counter' do
    subject_post.likes_counter = 'string'
    expect(subject_post).to_not be_valid
  end

  it 'returns its five most recent comments' do
    post.save
    Comment.create(text: 'Test comments', author: user, post: subject_post)
    Comment.create(text: 'Test comments', author: user, post: subject_post)
    Comment.create(text: 'Test comments', author: user, post: subject_post)
    Comment.create(text: 'Test comments', author: user, post: subject_post)
    Comment.create(text: 'Test comments', author: user, post: subject_post)
    expect(subject_post.five_most_recent_comments.length).to eq(5)
  end

end
