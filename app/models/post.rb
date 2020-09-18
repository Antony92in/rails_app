class Post < ApplicationRecord
  validates :title, presence: true,
                    length: { maximum: 100, minimum: 5 }
  validates :author, presence: true
  has_one_attached :pic
  has_many :comments, dependent: :destroy
  has_many :likes, dependent: :destroy
  belongs_to :user, optional: true, foreign_key: :author
end
