class PostsController < ApplicationController

  def index
    @posts = Post.all
    if params[:concept].present?
      @posts = @posts.where("title LIKE ? OR description LIKE ?", "%#{params[:concept]}%", "%#{params[:concept]}%")
    end
  end

  def edit
    @post = Post.new
  end

  def create
    @post = Post.create(posts_params)
    if @post.save
      redirect_to posts_path, notice: "The post was succesfully saved"
    else
      redirect_to :new
    end
  end

  def show
    @post = Post.find(params[:id])
  end

  def edit

  end

  def update

  end

  def delete

  end

  private
    def posts_params

    end
end
