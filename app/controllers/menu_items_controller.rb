class MenuItemsController < ApplicationController
  before_action :signed_in_business, only: [:create, :destroy]
  before_action :correct_business,   only: :destroy

  def index
  end

  def create
    @menu_item = current_business.menu_items.build(menu_item_params)
    if @menu_item.save
      flash[:success] = "Menu Item created!"
      redirect_to root_url
    else
      @feed_items = []
      render 'static_pages/home'
    end
  end

  def destroy
    @menu_item.destroy
    @feed_items = current_business.feed.paginate(page: params[:page])
    respond_to do |format|
      format.html { redirect_to root_url }
      format.js
    end
  end

  private

    def menu_item_params
      params.require(:menu_item).permit(:name, :description, :price)
    end

    def correct_business
      @menu_item = current_business.menu_items.find_by(id: params[:id])
      redirect_to root_url if @menu_item.nil?
    end
end