class PostsController < ApplicationController
  before_action :find_post, only: %i(show destroy)

  def index
    @posts = Post.eager_load(:photos, :user, likes: :user).recent_post.limit 10
    @post = Post.new
  end

  def create
    @post = current_user.posts.build post_params
    if @post.save
      if params[:images]
        params[:images].each do |img|
          @post.photos.create(image: img)
        end
      end
      redirect_to posts_path
      flash[:notice] = "Saved"
    else
      flash[:alert] = "Something went wrong"
      redirect_to posts_path
    end
  end

  def show
    @photos = @post.photos
    @likes = @post.likes.includes :user
    @is_likes = @post.is_liked current_user
    set_meta_tags title: "Photo by "+@post.user.name
  end

  def destroy
    if @post.user_id == current_user.id
      if @post.destroy
        flash[:notice] = "Post deleted!"
      else
        flash[:alert] = "Something went wrong ..."
      end
    else
      flash[:notice] = "You don't permission to do that!"
    end 
    redirect_to posts_path
  end

  private

  def find_post
    @post = Post.find_by id: params[:id]
    return if @post
    flash[:danger] = "Post not exist!"
    redirect_to root_path
  end

  def post_params
    params.require(:post).permit :content
  end
end
