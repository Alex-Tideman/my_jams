require 'rails_helper'

RSpec.describe Song, type: :model do
  let(:song) do
    Song.new(title: "Baby", artist: "Justin Bieber", song_url: "soundcloud.com")
  end

  it 'is valid' do
    expect(song).to be_valid
  end

  it 'is invalid without a title' do
    song.title = nil
    expect(song).not_to be_valid
  end

  it 'is invalid without an artist' do
    song.artist = nil
    expect(song).not_to be_valid
  end
  it 'is valid without a song url' do
    song.song_url = nil
    expect(song).to be_valid
  end

end