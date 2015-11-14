class AdvertisementsController < ApplicationController
  def index # views/advertisements/index.html.erb - GET /advertisements
    @advertisements = Advertisement.all
  end

  def show # views/advertisements/show.html.erb - GET /advertisements/:id
    @advertisement = Advertisement.find(params[:id])
  end

  def new# views/advertisements/new.html.erb - GET /advertisements/new
    @advertisement = Advertisement.new
  end

  def create # no view - POST /advertisements
    @advertisement = Advertisement.new
    @advertisement.title = params[:advertisement][:title]
    @advertisement.copy = params[:advertisement][:copy]
    @advertisement.price = params[:advertisement][:price]
    
    if @advertisement.save
      flash[:notice] = "Advertisement was saved."
      redirect_to @advertisement
    else
      flash[:error] = "There was an error saving the advertisement. Please try again"
      render :new
    end
  end
  
  def edit
    @advertisement = Advertisement.find(params[:id])
  end
  
  def update
    @advertisement = Advertisement.find(params[:id])
    
    if @advertisement.update_attributes(ad_params)
      redirect_to @advertisement, notice: "Ad created"
    else
      flash[:error] = "Something went wrong"
      render :edit
    end
  end
  
  private
  
  def ad_params
    params.require(:advertisement).permit(:copy, :price, :title)
  end
end
