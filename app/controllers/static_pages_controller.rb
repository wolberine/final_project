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
  end

end
