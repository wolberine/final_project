class BusinessesController < ApplicationController
  def new
    @business = Business.new
  end

  def show
    @business = Business.find(params[:id])
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
end
