class TvShowsController < ApplicationController
  def index
    @tvshows = TvShow.all
  end
end
