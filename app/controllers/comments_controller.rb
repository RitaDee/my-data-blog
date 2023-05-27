class CommentsController < ApplicationController
  load_and_authorize_resource
  
  def new
    @post = Post.find(params[:post_id])
    @comment = @post.comments.new
  end

  
  def create
    @post = Post.find(params[:post_id])
    @comment = @post.comments.new(comment_params)
    @comment.author = current_user
    if @comment.save
      @user = User.find(params[:user_id])
      redirect_to user_post_path(@user, @post)
    else
      render :new
    end
  end

  def destroy
    comment = Comment.find(params[:id])
    comment.destroy
    respond_to do |format|
      format.html do
        redirect_to request.referrer, notice: 'comment deleted successfully'
      end
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:text)
  end
end
