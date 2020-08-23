class VideoObserver < ActiveRecord::Observer
  def before_save(resource)
    video = Yt::Video.new url: resource.url
    resource.uid = video.id
    resource.title = video.title
    resource.description = video.description
    resource.published_at = video.published_at
  rescue Yt::Errors::NoItems
    raise 'Video not found'
  end
end
