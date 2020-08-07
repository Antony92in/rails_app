class WelcomeController < ApplicationController
  def index
  	render 'welcome/welcome'
  end

  def userpage
    @posts = Post.all
  	render 'welcome/userpage'
  end
end
