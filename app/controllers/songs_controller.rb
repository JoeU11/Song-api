class SongsController < ApplicationController
  def index
    render json: Song.all.as_json
  end

  def show
    song = Song.find_by(id: params[:id])
    render json: song.as_json
  end

  def update
    song = Song.find_by(id: params[:id])
    # binding.pry
    song.title = params[:title] || song.title
    song.album = params[:album] || song.album
    song.artist = params[:artist] || song.artist
    song.year = params[:year] || song.year
    song.save
    render json: song.as_json
  end

  def create
    song = Song.new(title: params[:title], album: params[:album], artist: params[:artist], year: params[:year])
    song.save
    render json: song.as_json
  end

  def destroy
    song = Song.find_by(id: params[:id])
    song.destroy
    render json: {message: "This item has been deleted. I think."}
  end
end
