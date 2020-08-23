class Video < ActiveRecord::Base
  YT_URL_FORMAT = /\A.*(youtu.be\/|v\/|u\/\w\/|embed\/|watch\?v=|\&v=)([^#\&\?]*).*/i

  belongs_to :user, dependent: :destroy

  validates :url, presence: true,
                  uniqueness: true,
                  format: YT_URL_FORMAT

  delegate :username, to: :user
end
