class BusinessesController < ApplicationController
  before_action :signed_in_business, only: [:edit, :update, :index, :destroy]
  before_action :correct_business,   only: [:edit, :update]
  before_action :admin_business,     only: :destroy

  def index
    @businesses = Business.paginate(page: params[:page])
  end

  def new
    @business = Business.new
  end

  def destroy
    Business.find(params[:id]).destroy
    flash[:success] = "Business data deleted."
    redirect_to businesses_url
  end

  def show
    @business = Business.find(params[:id])
  end

  def edit
    @business = Business.find(params[:id])
  end  

  def update
    @business = business.find(params[:id])
    if @business.update_attributes(business_params)
      flash[:success] = "Profile updated"
      redirect_to @business
    else
      render 'edit'
    end
  end

  def create
    @business = Business.new(business_params)    
    if @business.save
      flash[:success] = "Welcome to the Sample App!"
      redirect_to @business #redirects to user show page, short hand
    else
      render 'new'
    end
  end

  private

    def business_params
      params.require(:business).permit(:name, :email, :address,:password,
                                   :password_confirmation)
    end

    def signed_in_business
      unless signed_in?
        store_location
        redirect_to signin_url, notice: "Please sign in."
      end    
    end

    def correct_business
      @business = Business.find(params[:id])
      redirect_to(root_url) unless current_business?(@business)
    end

    def admin_business
      redirect_to(root_url) unless current_business.admin?
    end
end
