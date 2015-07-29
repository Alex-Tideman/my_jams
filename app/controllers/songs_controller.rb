class SongsController < ApplicationController

  def index
    @songs = Song.order(:artist)
  end

  def show
    @song = Song.find(params[:id])
  end

  def new
    @song = Song.new
  end

  def create
    @song = Song.new(song_params)
    if @song.save
      session[:most_recent_song_title] = @song.title
      flash[:notice] = "Song successfully created!"
      redirect_to song_path(@song)
    elsif @song.title.blank?
      flash[:error] = "Song is missing title"
      render :new
    else
      render :new
    end
  end

  def edit
    @song = Song.find(params[:id])
  end

  def update
    @song = Song.find(params[:id])
    if @song.update(song_params)
      redirect_to song_path(@song)
    else
      render :edit
    end
  end

  def destroy
    @song = Song.find(params[:id])
    @song.destroy
    session[:most_recent_song_title] = Song.all.last.title
    redirect_to songs_path
  end

  def no_track
    render :no_track
  end

  private

  def song_params
    params.require(:song).permit(:title, :artist, :song_url)
  end

end
