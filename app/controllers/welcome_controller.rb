class WelcomeController < ApplicationController

  def index
    @tvshows = TvShow.all
    if current_user
      @tvreviews = current_user.active_relationships.map {|follow| follow.followee.tv_show_reviews }.flatten
    else
      @tvreviews = TvShowReview.order('id DESC').limit(10)
    end

  end

end
