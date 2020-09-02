class UsersController < ApplicationController
    before_action :authenticate_user!

    def users
        @users = (User.all).reject { |x| x == current_user }
        render 'users/users'
    end

    def show
        @user = User.find(params[:id])
        @posts = Post.where("author = ?", params[:id]).order(created_at: :desc)
        render 'users/showuser'
    end

    def follow
        arr = []
        followers = Follower.where("followed_user = ?", params[:user_id])
        followers.each do |i|
            arr << i.follower
        end
        if arr.include?(current_user.id)
            redirect_to action: "users"
        else
            fol = Follower.new
            fol.followed_user = params[:user_id]
            fol.follower = current_user.id
            fol.save!
            redirect_to action: "users" 
        end
     end
    
    def unfollow
        Follower.delete_by(followed_user: params[:user_id], follower: current_user.id)
        redirect_back fallback_location: '/'
    end
    
end
