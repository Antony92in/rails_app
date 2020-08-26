class PostsController < ApplicationController
    def new
        @post = Post.new        
    end
    
    def create
        @post = Post.new
        @post.title = params[:title]
        @post.author = current_user.id
        @post.content = params[:content]
        @post.pic = params[:pic]
        if @post.save
            redirect_to controller: "welcome", action: "mypage"
        else
            render 'new'
        end
    end
    
    def destroy
        post = Post.find(params[:id])
        post.destroy
        redirect_back fallback_location: '/'
    end
    
end
