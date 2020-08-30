class Post < ApplicationRecord
    validates :title, presence: true,
                    length: { maximum: 100 }
    has_one_attached :pic
    has_many :comments, dependent: :destroy
    has_many :likes, dependent: :destroy
    belongs_to :user, optional: true
    
end
