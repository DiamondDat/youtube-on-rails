class VideosController < ApplicationController
  include Pagy::Backend
  before_action :authenticate_user!, only: %i[new create]

  def index
    videos = Video.includes(:user).order('created_at DESC')
    @pagy, @videos = pagy(videos)
  end

  def new
    @video = Video.new
  end

  def create
    @video = current_user.videos.new(video_params)
    if @video.save
      flash[:success] = 'Video added!'
      redirect_to root_url
    else
      flash[:alert] = @video.errors.full_messages.join(', ')
      render :new
    end
  end

  private

  def video_params
    params.require(:video).permit(:url)
  end
end
