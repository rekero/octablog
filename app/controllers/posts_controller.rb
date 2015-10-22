class PostsController < ApplicationController
  before_action :all_posts, only: [:index, :create, :update, :destroy]
  before_action :set_posts, only: [:edit, :show, :update, :destroy]
  respond_to :html, :js

  def index
    respond_to do |format|
      format.html { render :index }
      format.json { render json: @posts }
    end
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.create(post_params)
  end

  def update
    @post.update_attributes(post_params)
  end

  def destroy
    @post.destroy
  end

  private

  def all_posts
    @posts = Post.by_date(params[:date]).by_author(params[:author]).by_category(params[:category]).by_rating(params[:min_rating], params[:max_rating]).order('rating DESC').limit(10)
  end

  def set_posts
    @post = Post.find(params[:id])
  end

  def post_params
    params.require(:post).permit(:name, :date, :category, :author)
  end
end
