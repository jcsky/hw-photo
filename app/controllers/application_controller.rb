class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception


  protected

  # def require_login
  #   unless current_user
  #     flash[:alert] = "Login Required"
  #     redirect_to root_path
  #     return
  #   end
  # end

end
