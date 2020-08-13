class WelcomeController < ApplicationController
  def index
    @posts = Post.where('author = ?', current_user.id)
  	render 'welcome/welcome'
  end

  # def userpage
  #   @posts = Post.where('author = ?', current_user.id)
  # 	render 'welcome/userpage'
  # end
end
