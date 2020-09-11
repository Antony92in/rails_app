class WelcomeController < ApplicationController
  def index
  	render 'welcome/welcome'
  end

  def mypage
    @posts = Post.where('author = ?', current_user.id).order(created_at: :desc)
    @followers = current_user.followings
  end
  
  
  
end
