# class Comment < ApplicationRecord
#   # belongs_to :user
#   # belongs_to :post
#   belongs_to :author, foreign_key: :user_id, class_name: 'User'
#   belongs_to :post, class_name: 'Post', counter_cache: :commentscounter
# end
