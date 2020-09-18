class CommentsController < ApplicationController
  before_action :authenticate_user!

  def create
    @comment = Comment.new
    @comment.comment = params[:comment]
    @comment.author = current_user.email
    @comment.post_id = params[:post_id]
    @comment.save!
    redirect_back fallback_location: '/'
  end
end
