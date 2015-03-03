class TvShowReviewsController < ApplicationController
  def index
    @tvshow = TvShow.find(params[:tv_show_id])
    @tvshowreviews = @tvshow.tv_show_reviews
  end

  def new
    @tvshow = TvShow.find(params[:tv_show_id])
    @tvshowreview = TvShowReview.new
  end

  def create
    @tvshowreview = TvShowReview.new(tvshowreview_params)
    @tvshow = TvShow.find(params[:tv_show_id])
    @tvshowreview.tv_show_id = params[:tv_show_id]
    @tvshowreview.save
    if @tvshowreview.save
      flash[:notice] = "Review successfully created."
      redirect_to tv_show_tv_show_review_path(@tvshow, @tvshowreview)
    else
      render :new
    end
  end

  def show
    @tvshow = TvShow.find(params[:tv_show_id])
    @tvshowreview = TvShowReview.find(params[:id])
  end

  private
  def tvshowreview_params
    params.require(:tv_show_review).permit(:review, :rating)
  end

end
