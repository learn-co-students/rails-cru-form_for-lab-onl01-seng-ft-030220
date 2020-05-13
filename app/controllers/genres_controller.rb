class GenresController < ApplicationController

    def index
        @genres = Genre.all
    end

    def show
        @genre = Genre.find(params[:id])
    end

    def new
        @genre = Genre.new
    end

    def create
        @genre = Genre.new(post_params(:name))
        @genre.save
        redirect_to genre_path(@genre)
    end

    def edit
        @genre = Genre.find(params[:id])
    end

    def update
        @genre = Genre.find(params[:id])
        @genre.update(post_params(:name))
        @genre.save
        redirect_to genre_path(@genre)
    end

    private

    def post_params(*arg)
        params.require(:genre).permit(*arg)
    end
    
end
