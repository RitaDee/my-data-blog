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

  it 'is valid with valid attributes' do
    expect(user).to be_valid
  end
  it 'is not valid without a name' do
    user.name = nil
    expect(user).to_not be_valid
  end
  it 'it is not valid with negeative number for post conuter' do
    user.posts_counter = -1
    expect(user).to_not be_valid
  end
  it 'it is not valid with string for post conuter' do
    user.posts_counter = 'string'
    expect(user).to_not be_valid
  end
end