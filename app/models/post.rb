class Post < ApplicationRecord
    has_one_attached :pic
    has_many :comments
    belongs_to :user, optional: true
end
