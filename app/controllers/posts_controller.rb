class PostsController < ApplicationController
  before_action :authenticate_user!, only: %i[ new create ]
  def index
    @posts = Post.all.order(created_at: :asc)
  end

  def new
    @post = Post.new
  end

  def create
    @post = current_user.posts.build(post_params)

    if @post.save
      redirect_to posts_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  def show
    @post = Post.find_by(params[:id])
  end

  private

  def post_params
    params.require(:post).permit(:title, :body, :user_id)
  end
end
