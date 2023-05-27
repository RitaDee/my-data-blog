class Comment < ApplicationRecord
  belongs_to :author, class_name: 'User'
  belongs_to :post

  after_save :update_post_comment_counter
  after_destroy :decrease_comments_counter

  private

  def update_post_comment_counter
    post.increment!(:comments_counter)
  end

  def decrease_comments_counter
    post.decrement!(:comments_counter)
  end
end
