class PostsController < ApplicationController

  before_action :set_post, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, only: [:edit, :update, :destroy, :create]

  def index
    @posts = Post.all
  end

  def show
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    if @post.save
      redirect_to @post, success: 'Post created'
    else
      render :new, danger: 'Post not created'
    end
  end

  def edit
  end

  def update
    if @post.update(post_params)
      redirect_to @post, info: 'Post successfully updated!'
    else
      flash[:danger] = "Post not updated...("
      render :edit
    end
  end

  def destroy
    if current_user.has_role? :admin
      @post.destroy
      redirect_to posts_path, success: "Post deleted"
    else
      flash[:danger] = "У вас нет прав"
      render :show
    end
  end

  private
  def set_post
    @post = Post.find(params[:id])
  end

  private

  def post_params
    params.require(:post).permit(:title, :summary, :body, :image, :all_tags)
  end
end