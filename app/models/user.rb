class User < ApplicationRecord
  has_one_attached :avatar
  has_many :posts

  has_many :follower_follows, foreign_key: :follower, class_name: "Follower"
  has_many :followings, through: :follower_follows, source: :followed_user

  has_many :following_follows, foreign_key: :followed_user, class_name: "Follower"
  has_many :followers, through: :following_follows, source: :follower
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
