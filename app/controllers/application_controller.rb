class ApplicationController < ActionController::Base
 
  protect_from_forgery
  alias :std_redirect_to :redirect_to
  def redirect_to(*args)
    flash.keep
    std_redirect_to *args
  end
  
  protected
  def authorize
    unless User.find_by_id(session[:user_id])
      redirect_to login_url, notice: "Please log in"
    end
  end
  
end
