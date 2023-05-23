require 'rails_helper'

RSpec.feature 'User Index Page', type: :feature do
     before :each do
    @user = User.create(name: 'Rita', photo: 'https://media.gettyimages.com/id/1278139568/', bio: 'Tech', posts_counter: 5)
  end

  scenario 'Displaying user information' do
    @user1 = User.create(name: 'Lilly', photo: 'user1.jpg', bio: 'teacher', posts_counter: 1)
    @user2 = User.create(name: 'user2', photo: 'user2.jpg', bio: 'farmer', posts_counter: 2)

    visit users_path

    # Test: Display username of all other users
    expect(page).to have_content(@user1.name)
    expect(page).to have_content(@user2.name)

    # Test: Display profile picture for each user
    expect(page).to have_css("img[src*='user1.jpg']")
    expect(page).to have_css("img[src*='user2.jpg']")

    # Test: Display number of posts each user has written
    expect(page).to have_content('Number of posts: 1')
  end
  
 scenario 'renders the user show page' do
    visit '/'
    click_link(@user.name, match: :first)
    expect(page).to have_content(@user.name)
  end
end
