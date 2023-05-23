require 'rails_helper'

RSpec.feature 'User Show Page', type: :feature do
  before do
    # Create necessary objects for the tests, such as a user and their posts
    @user = User.create(name: 'Rita', photo: 'profile.jpg', bio: 'Software Engineer', posts_counter: 6)
    Post.create(author: @user, title: 'Hi people', text: 'Lorem ipsum dolor sit amet.')
    Post.create(author: @user, title: 'Good', text: 'Consectetur adipiscing elit.')
    Post.create(author: @user, title: 'Dev', text: 'Sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.')
    @post = Post.create(author: @user, title: 'Hello', text: 'Lol')
  end

  scenario 'Display user information' do
    visit user_path(@user.id)

    # Test: Display user's profile picture
    expect(page).to have_css("img[src*='profile.jpg']")

    # Test: Display user's username
    expect(page).to have_content('Rita')

    # Test: Display number of posts the user has written
    expect(page).to have_content('Number of posts: 6')

    # Test: Display user's bio
    expect(page).to have_content('Software Engineer')

    # Test: Display the user's first 3 posts
    expect(page).to have_content(@user.most_three_recent_post[0])
    expect(page).to have_content(@user.most_three_recent_post[1])
    expect(page).to have_content(@user.most_three_recent_post[2])
    expect(page).to have_no_content(Post.where(author: @user))
  end
  scenario 'View all posts button redirects to user posts index page' do
    visit user_path(@user)

    # Test: Clicking "See all posts" button redirects to the user's posts index page
    click_link 'See all posts'
    expect(page).to have_current_path(user_posts_path(@user))
  end

  scenario 'Clicking on a user post redirects to post show page' do
    visit user_path(@user)

    # Test: Clicking on a user's post redirects to the post's show page
    click_link('See all posts')
    expect(page).to have_current_path(user_posts_path(@user))
  end

  scenario 'Back button redirects to previous page' do
    visit user_path(@user)

    # Test: Clicking "Back" button redirects to the previous page
    click_link 'Back'
    expect(page).to have_current_path(user_path(@user))
  end
end
