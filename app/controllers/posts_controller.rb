class PostsController < ApplicationController
    before_action :authenticate_user!

    def new
        @post = Post.new        
    end

    def show
        @posts = Post.where('author = ?', current_user.id).order(created_at: :desc)
        @followers = User.joins("INNER JOIN followers ON users.id = followers.followed_user WHERE follower = #{current_user.id} ")
        render 'welcome/mypage'
    end
    
    
    
    def create
        
        if current_user.id == false
            redirect_back fallback_location '/'
        else
            @post = Post.new(post_params)
        @post.author = current_user.id
        if @post.save
            redirect_to controller: "welcome", action: "mypage"
        else
            render 'new'
        end
        end
        
        
    end

    def edit
        @post = Post.find(params[:id])
    end
    

    def update
        @post = Post.find(params[:id])
        if @post.author == current_user.id
            if @post.update(post_params)
                redirect_to @post
            else 
                render 'edit'
            end
        else
            render plain: 'error!'
        end
    end
    
    def destroy
        @post = Post.find(params[:id])
        if @post.author == current_user.id
            @post.destroy
            redirect_back fallback_location: '/'  
        else
            render plain: 'error!'
        end
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
    
    private
    def post_params
        params.require(:post).permit(:title, :content, :pic )
    end
    
    
end
