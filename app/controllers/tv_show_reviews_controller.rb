class TvShowReviewsController < ApplicationController
  def index
    @tvshow = TvShow.find(params[:tv_show_id])
    @tvshowreviews = @tvshow.tv_show_reviews
  end

end
