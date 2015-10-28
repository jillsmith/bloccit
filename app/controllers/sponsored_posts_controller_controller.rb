class SponsoredPostsControllerController < ApplicationController
  def show
      @sponsoredpost = SponsoredPost.find(params[:id])
  end

  def new
      @topic = Topic.find(params[:topic_id])
      @sponsoredpost = SponsoredPost.new
  end

  def edit
    @sponsoredpost = SponoredPost.find(params[:id])
  end
end
