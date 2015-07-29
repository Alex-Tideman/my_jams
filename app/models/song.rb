class Song < ActiveRecord::Base
  validates :title, presence: true, uniqueness: { scope: :artist, message: "song already exists for artist" }
  validates :artist, presence: true

  def sound_cloud
    if self.song_url
      url ||= [self.song_url,'&amp;auto_play=false&amp;hide_related=false&amp;show_comments=false&amp;show_user=true&amp;show_reposts=false&amp;visual=true'].join
    else
      url ||= '/no_track'
    end
  end
end
