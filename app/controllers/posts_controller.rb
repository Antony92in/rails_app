class PostsController < ApplicationController
    def create
        post = Post.new
        post.title = params[:title]
        post.author = current_user.id
        post.content = params[:content]
        post.pic = params[:pic]
        post.save!
        redirect_to controller: "welcome", action: "userpage"
    end
    
end
