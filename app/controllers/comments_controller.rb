class CommentsController < ApplicationController
  # def new
  #   @post = Post.find(params[:post_id])
  #   @comment = @post.comments.new
  # end

  def create
    @post = Post.find(params[:post_id])
    @comment = @post.comments.new(comment_params)
    # binding.pry
    if @comment.save
      @post.comment_points
      @post.save
      redirect_to post_path(@post)
    else
      render :new
    end
  end

  def destroy
    @post = Post.find(params[:id])
    @comment = Comment.find(params[:id])
    @post.score -= 3
    @post.save
    if @comment.destroy
    redirect_to post_path(@post)
    flash[:notice] = 'comment deleted.'
  end

  end

  private
    def comment_params
      params.require(:comment).permit(:author, :body )
    end
end
