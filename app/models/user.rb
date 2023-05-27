class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable

  attribute :posts_counter, default: 0

  # possible values for User.role are 'admin' and 'user'. 'user' is default
  attribute :role, default: 'user'

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :confirmable
  has_many :posts, foreign_key: :author_id, dependent: :destroy
  has_many :comments, foreign_key: :author_id, dependent: :destroy
  has_many :likes, foreign_key: :author_id, dependent: :destroy

  validates :name, presence: true

  def most_three_recent_post
    posts.order(created_at: :desc).limit(3)
  end

  def admin?
    role == 'admin'
  end
end
