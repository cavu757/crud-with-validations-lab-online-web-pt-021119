class SongsController < ApplicationController
  before_action :set_model, only: [:show, :edit]

  def index
    @songs = Song.all
  end

  def new
    @song = Song.new
  end

  def show
  end

  def create
    @song = Song.new(post_params(:title, :released, :release_year, :artist_name, :genre))
    if @song.save
      redirect_to song_path(@song)
    else
      render :new
    end
  end

  def edit
  end

  def update
    @song = Song.find(params[:id])
    @song.update(post_params(:title, :released, :release_year, :artist_name, :genre))
    if @song.save
      redirect_to song_path(@song)
    else
      render :edit
    end
  end

  def destroy
    Song.find(params[:id]).destroy
    redirect_to songs_url
  end

  private

    def set_model
      @song = Song.find(params[:id])
    end

    def post_params(*args)
      params.require(:song).permit(*args)
    end

end
