class Post < ApplicationRecord
    has_one_attached :pic
    belongs_to :user, optional: true
end