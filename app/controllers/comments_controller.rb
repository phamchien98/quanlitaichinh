class CommentsController < ApplicationController
  before_action :authenticate_user!

  def index
    @comments = @post.comments.includes :user
  end

  def create
    @comment = current_user.comments.build comment_params
    @comment.post_id = params[:post_id]
    if @comment.save
      @post = @comment.post
    else
      flash[:alert] = "Something went wrong ..."
    end
    respond_to :js
  end

  def destroy
    @comment = Comment.find params[:id]
    @post = @comment.post
    if @comment.destroy
    else
      flash[:alert] = "Something went wrong ..."
    end
    respond_to :js
  end

  private
  
  def comment_params
    params.required(:comment).permit :content
  end
end
