class TvShowsController < ApplicationController
  def index
    @tvshows = TvShow.all
  end

  def new
    @tvshow = TvShow.new
  end

  def create
    @tvshow = TvShow.new(tvshow_params)
    if @tvshow.save
      flash[:notice] = "TV Show successfully created."
      redirect_to tv_show_path(@tvshow)
    else
      render :new
    end
  end

  def show
    @tvshow = TvShow.find(params[:id])
  end

  private
  def tvshow_params
    params.require(:tv_show).permit(:title, :genre)
  end
end
