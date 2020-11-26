class PostsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:show, :index]
  skip_after_action :verify_policy_scoped, :only => :index
  before_action :set_post, only: [:show, :edit, :update, :destroy]

  def new
    @post = Post.new
    @swim_types = SwimType.all
    authorize @post
    @post.user = current_user
  end

  def create
    @post = Post.new(post_params)
    @post.user = current_user
    authorize @post
    if @post.save
      redirect_to root_path
    else
      render :new
    end
  end

  # def index
  #   @posts = Posts.where.not(latitude: nil, longitude: nil)
  #   @posts = @posts.where('event_date <= ?', Date.today).order(:event_date)

  #   @markers = @posts.map do |post|
  #     {
  #       lat: post.latitude,
  #       lng: post.longitude,
  #       infoWindow: render_to_string(partial: "infowindow", locals: { post: post }),
  #     }
  #   end
  #   @months = ["janvier", "février", "mars", "avril", "mai", "juin", "juillet", "août", "septembre", "octobre", "novembre", "décembre"]
  # end

  # def show
  #   @post = Post.find(params[:id])
  #   skip_authorization
  #   @markers = [{ lat: @post.latitude, lng: @post.longitude }]
  # end

  def show
  end

  def edit
  end

  def update
    @post.update(post_params)
    redirect_to post_path(@post)
  end

  def destroy
    @post.destroy
    redirect_to posts_path
  end

  private

  def post_params
    params.require(:post).permit(:title, :content, :event_date, :city, :photo, :swim_type_id)
  end

  def set_post
    @post = Post.find(params[:id])
    authorize @post
  end

end
