class WelcomeController < ApplicationController
  def index
  	render 'welcome/welcome'
  end

  def mypage
    @posts = current_user.posts.order(created_at: :desc)
    @followers = current_user.followings
  end
  
  def feed
    @posts = Post.where(author: current_user.followings.pluck(:id)).order(created_at: :desc)
    render 'welcome/feed'
  end
  
  
end
