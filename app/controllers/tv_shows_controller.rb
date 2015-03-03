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

  def edit
    @tvshow = TvShow.find(params[:id])
  end

  def update
    @tvshow = TvShow.find(params[:id])
    if @tvshow.update(tvshow_params)
      flash[:notice] = "TV Show successfully updated."
      redirect_to tv_show_path(@tvshow)
    else
      render :edit
    end
  end

  def destroy
    @tvshow = TvShow.find(params[:id])
    @tvshow.destroy
    flash[:notice] = "TV Show successfully deleted."
    redirect_to tv_shows_path
  end

  private
  def tvshow_params
    params.require(:tv_show).permit(:title, :genre)
  end
end