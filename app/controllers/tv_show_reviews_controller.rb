class TvShowReviewsController < ApplicationController
  before_action :authenticate, except: [:index]

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
    @tvshowreview.user_id = current_user.id
    @tvshowreview.save
    if @tvshowreview.save
      flash[:notice] = "Review successfully created."
      redirect_to tv_show_path(@tvshow)
    else
      render :new
    end
  end

  def show
    @tvshow = TvShow.find(params[:tv_show_id])
    @tvshowreview = TvShowReview.find(params[:id])
  end

  def edit
    @tvshow = TvShow.find(params[:tv_show_id])
    @tvshowreview = TvShowReview.find(params[:id])
  end

  def update
    @tvshow = TvShow.find(params[:tv_show_id])
    @tvshowreview = TvShowReview.find(params[:id])
    if current_user.id == @tvshowreview.user_id || current_user.admin == true
      @tvshowreview.tv_show_id = params[:tv_show_id]
      @tvshowreview.update(tvshowreview_params)
        redirect_to tv_show_path(@tvshow)
    else
      flash[:alert] = "You are not authorized to edit this review."
      render :edit

    end
  end

  def destroy
    @tvshow = TvShow.find(params[:tv_show_id])
    @tvshowreview = TvShowReview.find(params[:id])
    @tvshowreview.destroy
    redirect_to tv_show_path(@tvshow)
  end

  private
  def tvshowreview_params
    params.require(:tv_show_review).permit(:review, :rating)
  end

end
