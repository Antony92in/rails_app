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

    def like
        @like = Like.new
        @like.post_id = params[:post_id]
        @like.user_id = current_user.id
        if @like.save
            redirect_back fallback_location: '/'
        end      
    end

    def dislike
        Like.delete_by(post_id: params[:post_id], user_id: current_user.id)
        redirect_back fallback_location: '/'
    end
    
    
    
end
