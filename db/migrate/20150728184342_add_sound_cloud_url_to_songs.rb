class AddSoundCloudUrlToSongs < ActiveRecord::Migration
  def change
    add_column :songs, :song_url, :text
  end
end
