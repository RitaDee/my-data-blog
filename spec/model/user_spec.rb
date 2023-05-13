require 'rails_helper'

RSpec.describe User, type: :model do
  subject(:user) do
    User.new(
      name: 'Something',
      photo: 'http://rrrrrrrr/something.jpg',
      bio: 'Something test',
      posts_counter: 0
    )
  end

   let(:first_post) do
    Post.create(author: user, title: 'Hello First', text: 'This is my first post', likes_counter: 1, comments_counter: 0)
  end

  let(:second_post) do
    Post.create(author: user, title: 'Hello Second', text: 'This is my second post', likes_counter: 2,
                comments_counter: 0)
  end

  let(:third_post) do
    Post.create(author: user, title: 'Hello Third', text: 'This is my third post', likes_counter: 3, comments_counter: 0)
  end

  it 'is valid with valid attributes' do
    expect(user).to be_valid
  end
  it 'is not valid without a name' do
    user.name = nil
    expect(user).to_not be_valid
  end
  it 'it is not valid with negative number for post counter' do
    user.posts_counter = -1
    expect(user).to_not be_valid
  end
  it 'it is not valid with string for post counter' do
    user.posts_counter = 'string'
    expect(user).to_not be_valid
  end

  it 'returns the three lastest posts of a user' do
    subject.save
    first_post.save
    second_post.save
    third_post.save
    expect(subject.most_three_recent_post.length).to eq(3)
  end
end
