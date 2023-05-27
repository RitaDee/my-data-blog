class PostsController < ApplicationController
  load_and_authorize_resource
  before_action :authenticate_user!

  def index
    @user = User.find(params[:user_id])
    @posts = @user.posts.includes(:author)
  end

  def new
    @post = Post.new
    @current_user = current_user
  end

  def show
    # @post = Post.find(params[:id])
    # @user = User.find(@post.author_id)
    @user = User.find(params[:user_id])
    @post = @user.posts.find(params[:id])
    @comments = @post.comments.includes(:author)
  end

  def create
    @post = current_user.posts.new(post_params)
    if @post.save
      redirect_to user_posts_path(current_user)
    else
      render :new
    end
  end

  def destroy
    post = Post.find(params[:id])
    post.destroy
    respond_to do |format|
      format.html do
        redirect_to user_posts_path(params[:user_id]),
                    notice: 'post deleted successfully'
      end
    end
  end

  private

  def post_params
    params.require(:new_post).permit(:title, :text)
  end
end
