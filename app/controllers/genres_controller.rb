class GenresController < ApplicationController

  def show
    @genre = Genre.find(params[:id])
    @tvshows = @genre.tv_shows
  end

end
