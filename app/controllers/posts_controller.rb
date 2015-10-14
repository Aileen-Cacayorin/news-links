class PostsController < ApplicationController
  def index
    @posts = Post.all.sort_by {|post|
      (post.score - ((Time.new - post.created_at)/100000).ceil)
    }
    @posts.reverse!
    # @posts.each do |post|
    #   days = ((Time.new - post.created_at)/100000).ceil
    #   post.score -= days
    # end

    render :index
  end



  def show
    @post = Post.find(params[:id])
    @comments = @post.comments
    @comment = Comment.new
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)

    if @post.save
      flash[:notice] = "Post added."
      redirect_to posts_path
    else
      render :new
    end
  end

  def edit
    @post = Post.find(params[:id])
  end

  def update
    @post = Post.find(params[:id])
    if params[:upvote] == "true"
      @post.upvote
      @post.save
      redirect_to post_path
      flash[:notice] = 'Post upvoted.'
    elsif params[:downvote] == "true"
      @post.downvote
      @post.save
      redirect_to post_path
      flash[:notice] = 'Post downvoted.'
    elsif @post.update(post_params)
      redirect_to post_path
      flash[:notice] = 'Post updated.'
    else
      render :edit
    end
  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy

    redirect_to posts_path
    flash[:notice] = 'post deleted.'

  end

  private
    def post_params
      params.require(:post).permit(:author, :title, :link)
    end
end
