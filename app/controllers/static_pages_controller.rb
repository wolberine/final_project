class StaticPagesController < ApplicationController
  def home
    if signed_in?
      @menu_item = current_business.menu_items.build 
      @feed_items = current_business.feed.paginate(page: params[:page])
    end
  end

  def help
  end
  
  def contact
  end


  respond_to :html, :js, :json
  def map
    @businesses = Business.all
    @hash = Gmaps4rails.build_markers(@businesses) do |business, marker|
      marker.lat business.latitude
      marker.lng business.longitude
      marker.infowindow business.name
      marker.json({ title: business.name })
    end
    @menu_item = current_business.menu_items.build 
    @feed_items = current_business.feed.paginate(page: params[:page])
    
    respond_to do |format|
      @infowindow = params[:infowindow]
      format.js { render 'map' }
      format.html 
      format.json 
    end
  end

end
