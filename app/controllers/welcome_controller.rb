class WelcomeController < ApplicationController

  def index
    @tvshows = TvShow.all
    @reviews = TvShowReview.all
  end

end
