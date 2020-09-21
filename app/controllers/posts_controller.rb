class PostsController < ApplicationController
  before_action :authenticate_user!

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    @post.author = current_user.id
    if @post.save
      redirect_to controller: 'welcome', action: 'mypage'
    else
      render 'new'
    end
  end

  def edit
    @post = Post.find(params[:id])
  end

  def update
    @post = Post.find(params[:id])
    if @post.author == current_user.id
      if @post.update(post_params)
        redirect_to controller: 'welcome', action: 'mypage'
      else
        render 'edit'
      end
    else
      render plain: 'error!'
    end
  end
  
  def pic_delete
    @post = Post.find(params[:id])
    @post.pic.purge
    redirect_to action: "edit"
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
    redirect_back fallback_location: '/' if @like.save
  end

  def dislike
    Like.delete_by(post_id: params[:post_id], user_id: current_user.id)
    redirect_back fallback_location: '/'
  end

  private

  def post_params
    params.require(:post).permit(:title, :content, :pic)
  end
end
