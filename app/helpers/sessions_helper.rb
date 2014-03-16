module SessionsHelper

  def sign_in(business)
    remember_token = Business.new_remember_token
    cookies.permanent[:remember_token] = remember_token
    business.update_attribute(:remember_token, Business.hash(remember_token))
    self.current_business = business
  end

  def sign_out
    current_business.update_attribute(:remember_token,
                                  Business.hash(Business.new_remember_token))
    cookies.delete(:remember_token)
    self.current_business = nil
  end

  def signed_in?
    !current_business.nil?
  end

  def current_business=(business)
    @current_business = business
  end

  def current_business
    remember_token = Business.hash(cookies[:remember_token])
    @current_business ||= Business.find_by(remember_token: remember_token)
  end

  def current_business?(business)
    business == current_business
  end

    def signed_in_business
      unless signed_in?
        store_location
        redirect_to signin_url, notice: "Please sign in."
      end    
    end

  def redirect_back_or(default)
    redirect_to(session[:return_to] || default)
    session.delete(:return_to)
  end

  def store_location
    session[:return_to] = request.url if request.get?
  end
  
end