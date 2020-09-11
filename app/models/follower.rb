class Follower < ApplicationRecord
    belongs_to :follower, class_name: "User", foreign_key: "follower"
    belongs_to :followed_user, class_name: "User", foreign_key: "followed_user"
end
