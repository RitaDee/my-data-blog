# require 'rails_helper'

# RSpec.feature 'User Post Index Page', type: :feature do
#   before do
#     # Create necessary objects for the tests, such as a user, posts, and comments
#     @user = User.create(name: 'Rita', photo: 'profile.jpg')
#     @user.save # Save the user object
#     @first_post = Post.create(title: 'Post 1', text: 'Lorem ipsum dolor sit amet.', author: @user)
#     @second_post = Post.create(title: 'Post 2', text: 'Consectetur adipiscing elit.', author: @user)
#     # Create comments for the posts
#     Comment.create(text: 'First comment on post 1', post: @post1)
#     Comment.create(text: 'Second comment on post 1', post: @post1)
#     Comment.create(text: 'Comment on post 2', post: @post2)
#   end

#   scenario 'Display user post index page' do
#     visit user_posts_path(@user.id)


#     # Test: Verify user's profile picture is displayed
#     expect(page).to have_css("img[src*='profile.jpg']")

#     # Test: Verify user's username is displayed
#     expect(page).to have_content('Rita')

#     # Test: Verify number of posts the user has written is displayed
#     expect(page).to have_content('Number of posts')

#     # Test: Verify post titles and bodies are displayed
#     expect(page).to have_content('Post 1')
#     expect(page).to have_content('Lorem ipsum dolor sit amet.')
#     expect(page).to have_content('Post 2')
#     expect(page).to have_content('Consectetur adipiscing elit.')

#     # Test: Verify first comments on posts are displayed
#     expect(page).to have_content('First comment on post 1')
#     expect(page).to have_content('Second comment on post 1')
#     expect(page).to have_content('Comment on post 2')

#     # Test: Verify number of comments and likes on posts are displayed
#     expect(page).to have_content('2 comments')
#     expect(page).to have_content('0 likes')

#     # Test: Verify pagination section is displayed
#     expect(page).to have_selector('.pagination')

#     # Test: Click on a post and verify redirection to post show page
#     click_link 'Post 1'
#     expect(page).to have_current_path(user_post_path(@user, @post1))
#   end
# end
