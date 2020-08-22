class WelcomeController < ApplicationController
  def index
  	render 'welcome/welcome'
  end

  def userpage
    @posts = Post.where('author = ?', current_user.id).order(created_at: :desc)
  	render 'welcome/userpage'
  end
  
  
end
