class PostsController < ApplicationController
  before_action :find_post_id, only: [:show, :edit, :update, :destroy]
  def index
    @posts = Post.all
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    if @post.save
      redirect_to root_url, notice: "投稿を完了しました"
    else
      render :new
    end
  end

  def show

  end

  def edit

  end

  def update
    if @post.update(post_params)
      redirect_to root_url, notice: "投稿の編集を完了しました"
    else
      render :edit
    end
  end

  def destroy
    @post.destroy
  end

  private
  def post_params
    params.require(:post).permit(:title, :description).merge(user_id: current_user.id)
  end

  def find_post_id
    @post = Post.find_by(id: params[:id])
  end
end
