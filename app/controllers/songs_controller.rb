class SongsController < ApplicationController

    def index
        @song = Song.find_by(params[:name])
    end

    def new
        @song = Song.new
    end

    def create
        @genre = Genre.find_by_id(params[:id])
        @artist = Artist.find_by_id(params[:id])
        @song = Song.new(song_params(:name))
        @song.save
        redirect_to song_path(@song)
    end

    def show
        @song = Song.find_by_id(params[:id])
        @genre = Genre.find_by_id(params[:id])
        @artist = Artist.find_by_id(params[:id])
    end

    def edit
        @song = Song.find_by_id(params[:id])
    end

    def update
        @song = Song.find_by_id(params[:id])
        @song.update(song_params(:name))
        redirect_to song_path(@song)
    end

    private

    def song_params(*args)
        params.require(:song).permit(*args)
    end
end
