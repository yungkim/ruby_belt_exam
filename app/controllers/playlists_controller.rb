class PlaylistsController < ApplicationController
  def index
      redirect_to '/songs/index'
  end
  def create
    playlist = Playlist.new(playlist_params)
    playlist.user_id = session[:user_id]
    if playlist.save
      flash[:notice] = "Successfully added to playlist'"
    else
      flash[:errors] = song.errors.full_messages
    end
    redirect_to '/songs/index'
  end
  def destroy
    playlist = playlist.where(playlists_params)
    playlist.last.destroy
    redirect_to '/songs/index'
  end
  private
  def playlist_params
      params.permit(:user_id, :song_id)
  end
end
