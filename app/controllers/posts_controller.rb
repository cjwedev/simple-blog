class PostsController < ApplicationController
  skip_before_action :authorized, only: [:index, :show]

  def index
    @posts = Post.order(updated_at: :desc)
  end

  def show
    @post = Post.find(params[:id])
  end
end
