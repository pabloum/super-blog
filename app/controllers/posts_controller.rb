class PostsController < ApplicationController

  def index
    @posts = Post.all
    if params[:concept].present?
      @posts = @posts.where("title LIKE ? OR description LIKE ?", "%#{params[:concept]}%", "%#{params[:concept]}%")
    end
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.create(posts_params)
    if @post.save
      redirect_to posts_path, notice: "The post was succesfully saved"
    else
      render :new
    end
  end

  def show
    @post = Post.find(params[:id])
  end

  def edit
    @post = Post.find(params[:id])
  end

  def update
    @post = Post.find(params[:id])
    if @post.update(posts_params)
      redirect_to posts_path, notice: "The post was succesfully edited"
    else
      render :edit
    end
  end

  def destroy
    post = Post.find(params[:id])
    post.destroy

    redirect_to posts_path, notice: "Post succesfully deleted"
  end

  private
    def posts_params
      params.require(:post).permit(:title, :body)
    end
end
