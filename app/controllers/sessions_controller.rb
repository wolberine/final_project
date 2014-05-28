class SessionsController < ApplicationController

  def new
  end

  def create
    business = Business.find_by(email: params[:session][:email].downcase)
    if business && business.authenticate(params[:session][:password])
      sign_in business
      redirect_back_or business
    else
      flash.now[:error] = 'Invalid email/password combination'
      render 'new'
    end
  end

  def destroy
    sign_out
    redirect_to root_url
  end

  def mobile
    @skip_header = true
    @skip_footer = true
    @mobile_body = true
    @business = Business.new
  end

  def mobile_create
    @skip_header = true
    @skip_footer = true
    @mobile_body = true
    business = Business.find_by(email: params[:session][:email].downcase)
    if business && business.authenticate(params[:session][:password])
      sign_in business
      redirect_back_or business
    else
      flash.now[:error] = 'Invalid email/password combination'
      render 'new'
    end
  end

end
