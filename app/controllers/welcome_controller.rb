class WelcomeController < ApplicationController

  def index
    @tvshows = TvShow.all
    @tvreviews = TvShowReview.order('id DESC').limit(10)
  end

end
