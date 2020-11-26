class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:home]

  def home
    @posts = Post.where.not(latitude: nil, longitude: nil)

    @posts = @posts.where('event_date <= ?', Date.today).order(:event_date)
    @first_3_posts = [@posts.first, @posts.second, @posts.third]
    @other_posts = @posts.where.not(id: @posts.first).to_a.each_slice(3).to_a

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
