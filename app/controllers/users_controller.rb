class UsersController < ApplicationController
    def users
        @users = User.all
        render 'users/users'
    end

    def show
        @user = User.find(params[:id])
        @posts = Post.where("author = ?", params[:id]).order(created_at: :desc)
        render 'users/showuser'
    end

    def follow
        fol = Follower.new
        fol.followed_user = params[:user_id]
        fol.follower = current_user.id
        fol.save!
        redirect_to action: "users"
     end
    
    def unfollow
        Follower.delete_by(followed_user: params[:user_id], follower: current_user.id)
        redirect_back fallback_location: '/'
    end
    
end
