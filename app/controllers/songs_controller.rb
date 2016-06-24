class SongsController < ApplicationController
  def index
    @user = User.find_by_id(session[:user_id])
    @songs = Song.all
    @new_song = Song.new
  end

  def new
  end

  def create
    song = Song.new(songs_params)
    song.user_id = session[:user_id]
    if song.save
      flash[:notice] = "Successfully added '#{song.title} by #{song.artist}'"
      redirect_to '/songs/index'
    else
      flash[:errors] = song.errors.full_messages
      redirect_to '/songs/index'
    end
  end

  def show
      @song = Song.find(params[:id])
      @playlists = Song.find(params[:id]).playlists
  end

  private
  def songs_params
      params.require(:song).permit(:title, :artist)
  end
end
