class Comment < ApplicationRecord
    belongs_to :post

    validates :comment, presence: true,
             length: { minimum: 5, maximum: 100 }

    
    validates :author, presence: true

end
