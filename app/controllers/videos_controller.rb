class VideosController < ApplicationController
  include Pagy::Backend

  def index
    videos = Video.order('created_at DESC')
    @pagy, @videos = pagy(videos)
  end

  def new
    @video = Video.new
  end

  def create
    @video = Video.new(video_params)
    if @video.save
      flash[:success] = 'Video added!'
      redirect_to root_url
    else
      render :new
    end
  end

  private

  def video_params
    params.require(:video).permit(:url)
  end
end
