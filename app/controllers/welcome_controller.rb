class WelcomeController < ApplicationController
  def index
  	render 'welcome/welcome'
  end

  def mypage
    @posts = Post.where('author = ?', current_user.id).order(created_at: :desc)
    @followers = User.joins("INNER JOIN followers ON users.id = followers.followed_user WHERE follower = #{current_user.id} ")
  	render 'welcome/mypage'
  end
  
  
end
