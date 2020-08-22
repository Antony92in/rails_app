class UsersController < ApplicationController
    def users
        @users = User.all
        render 'users/users'
    end

    def show
        @user = User.find(params[:id])
        @posts = Post.where("author = ?", params[:id])
        render 'users/showuser'
    end
    
    
end
