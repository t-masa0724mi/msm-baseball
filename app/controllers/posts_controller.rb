class PostsController < ApplicationController

  def index
    @posts = Post.includes(:user).order('created_at DESC')
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    if @post.save
      redirect_to root_path
    else
      redirect_to new_post_path
    end
  end

  private
    def post_params
      params.require(:post).permit(:text).merge(user_id: current_user.id)
    end

end
