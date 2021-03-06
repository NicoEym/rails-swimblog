class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:home]

  def home
    @posts = Post.where.not(latitude: nil, longitude: nil)

    @posts = @posts.where('event_date <= ?', Date.today).order(:event_date)
    if @posts.count <= 3

    else
      @first_3_posts = [@posts.first, @posts.second, @posts.third]

    end
    @markers = @posts.map do |post|
      {
        lat: post.latitude,
        lng: post.longitude,
        infoWindow: render_to_string(partial: "info_window", locals: { post: post }),
        #image_url: helpers.asset_url(post.photo)
      }
    end
    @months = ["January", "February", "March", "April", "May", "June", "July", "August", "September", "October", "November", "December"]
  end
end
