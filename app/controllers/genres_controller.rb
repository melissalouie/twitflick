class GenresController < ApplicationController

  def show
    @genre = Genre.find(params[:id])
    @tv_shows = @genre.tv_shows.sort_by(&:id).reverse
  end

end
