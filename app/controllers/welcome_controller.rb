class WelcomeController < ApplicationController
  def index
  	render 'welcome/welcome'
  end

  def userpage
  	render 'welcome/userpage'
  end
end
