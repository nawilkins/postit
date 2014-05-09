class PostsController < ApplicationController

  before_action :find_post_id, only: [:show, :edit, :update]

  def index
    @posts = Post.all
  end

  def show
    @comment = Comment.new
  end

  def new
    @post = Post.new
    @categories = Category.all
  end

  def create
    
    @post = Post.new(post_params)
    @post.creator = User.first

    binding.pry

    if @post.save
      flash[:notice] = 'Your post has been created'
      redirect_to posts_path
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @post.update(post_params)
      flash[:notice] = "Your post has been edited"
      redirect_to post_path(@post)
    else
      render :edit
    end
  end

  private

  def post_params
    params.require(:post).permit(:title, :url, :description, category_ids: [])
  end

  def find_post_id
    @post = Post.find(params[:id])
  end
end
