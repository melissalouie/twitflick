class WelcomeController < ApplicationController

  def index
    @tvshows = TvShow.all
    @tvreviews = TvShowReview.all
  end

end
