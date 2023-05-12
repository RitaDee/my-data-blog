class Like < ApplicationRecord
  belongs_to :author, foreign_key: :author_id, class_name: 'User'
  belongs_to :post, counter_cache: :likescounter

  def update_post_like_counter
    post.increment!(:likescounter)
  end
end
