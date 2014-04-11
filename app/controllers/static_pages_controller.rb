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



  def map
    @businesses = Business.all
    @business_feed_items = Business.all
    @hash = Gmaps4rails.build_markers(@businesses) do |business, marker|
      marker.lat business.latitude
      marker.lng business.longitude
      marker.infowindow business.name
      marker.json({ title: business.name, id: business.id })
    end
    #@menu_item = current_business.menu_items.build 
    #@feed_items = current_business.feed.paginate(page: params[:page])
    #@feed_items = Business.find_by(id: params[:id]).feed
    respond_to do |format|
      if request.xhr?
        new_business = Business.find(params[:id])
        @new_menu = new_business.feed
      end
      format.js { render 'map' }
      format.html 
      format.json 
    end
  end

  def mobile #mobile map view prototype
    @skip_header = true
    @skip_footer = true
    @mobile_body = true
    @businesses = Business.all
    @hash = Gmaps4rails.build_markers(@businesses) do |business, marker|
      marker.lat business.latitude
      marker.lng business.longitude
      marker.infowindow business.name
      marker.json({ title: business.name, id: business.id })
    end
    respond_to do |format|
      if request.xhr?
        new_business = Business.find(params[:id])
        @new_menu = new_business.feed
      end
      format.js { render 'map' }
      format.html 
      format.json 
    end
  end

end
