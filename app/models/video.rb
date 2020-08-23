class Video < ActiveRecord::Base
  YT_URL_FORMAT = /\A.*(youtu.be\/|v\/|u\/\w\/|embed\/|watch\?v=|\&v=)([^#\&\?]*).*/i

  validates :url, presence: true, format: YT_URL_FORMAT
end
