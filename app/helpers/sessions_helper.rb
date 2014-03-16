module SessionsHelper

  def sign_in(business)
    remember_token = Business.new_remember_token
    cookies.permanent[:remember_token] = remember_token
    business.update_attribute(:remember_token, Business.hash(remember_token))
    self.current_business = business
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
end