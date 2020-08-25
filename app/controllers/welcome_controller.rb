class WelcomeController < ApplicationController
  def index
  	render 'welcome/welcome'
  end

  def userpage
    @posts = Post.where('author = ?', current_user.id).order(created_at: :desc)
    @followers = User.joins("INNER JOIN followers ON users.id = followers.followed_user WHERE follower = #{current_user.id} ")
  	render 'welcome/userpage'
  end
  
  
end
