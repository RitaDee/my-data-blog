require 'rails_helper'

RSpec.feature 'User Show Page', type: :feature do
  before do
    # Create necessary objects for the tests, such as a user and their posts
    @user = User.create(name: 'John', photo: 'profile.jpg', bio: 'Software Engineer', posts_counter: 0)
    @post1 = Post.create(author: @user, title: 'Post 1', body: 'Lorem ipsum dolor sit amet.')
    @post2 = Post.create(author: @user, title: 'Post 2', body: 'Consectetur adipiscing elit.')
    @post3 = Post.create(author: @user, title: 'Post 3', body: 'Sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.')
  end

  scenario 'Display user information' do
    visit user_path(@user)

    # Test: Display user's profile picture
    expect(page).to have_css("img[src*='profile.jpg']")

    # Test: Display user's username
    expect(page).to have_content('John')

    # Test: Display number of posts the user has written
    expect(page).to have_content('Number of posts: 3')

    # Test: Display user's bio
    expect(page).to have_content('Software Engineer')

    # Test: Display the user's first 3 posts
    expect(page).to have_content('Post 1')
    expect(page).to have_content('Post 2')
    expect(page).to have_content('Post 3')
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
    click_link 'Post 1'
    expect(page).to have_current_path(post_path(@post1))
  end

  scenario 'Back button redirects to previous page' do
    visit user_path(@user)

    # Test: Clicking "Back" button redirects to the previous page
    click_link 'Back'
    expect(page).to have_current_path(some_previous_page_path)
    # Replace `some_previous_page_path` with the appropriate path or expectation for your case
  end
end
