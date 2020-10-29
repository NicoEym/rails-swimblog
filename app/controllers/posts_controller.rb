class PostsController < ApplicationController

  skip_before_action :authenticate_user!, only: [:show, :index]
  skip_after_action :verify_policy_scoped, :only => :index
  before_action :set_post, only: [:edit, :update, :destroy]

  def new
    @post = Post.new
    authorize @post
  end

  def create
    @post = Post.new(post_params)
    authorize @post
    if @post.save
      redirect_to posts_path(@post)
    else
      render :new
    end
  end

  def index
    @swim_races = SwimRace.where.not(latitude: nil, longitude: nil)
    @swim_races = @swim_races.where('dates >= ?', Date.today).order(:dates)
    @search = params["search"]
    if @search.present?
      @city_name = @search["city_name"]
      if @city_name != ""
        coordinates = Geocoder.search(@city_name).first.coordinates
        @swim_races = @swim_races.near(coordinates, 200).order(:dates)
      end
    end
    @markers = @swim_races.map do |swim_race|
      {
        lat: swim_race.latitude,
        lng: swim_race.longitude,
        infoWindow: render_to_string(partial: "infowindow", locals: { swim_race: swim_race }),
      }
    end
    @months = ["janvier", "février", "mars", "avril", "mai", "juin", "juillet", "août", "septembre", "octobre", "novembre", "décembre"]
  end



  def show
    @post = Post.find(params[:id])
    skip_authorization
    @markers = [{ lat: @swim_race.latitude, lng: @swim_race.longitude }]

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
    params.require(:post).permit(:title, :content, :event_date)
  end

  def set_post
    @post = Post.find(params[:id])
    authorize @post
  end

end
