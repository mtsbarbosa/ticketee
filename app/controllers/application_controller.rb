class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  private
  	def require_signin!
  		if current_user.nil?
  			flash[:error] = I18n.t("sessions._need_sign_before")
  			redirect_to signin_url
  		end
  	end
  	helper_method :require_signin!

  	def current_user
  		@current_user || User.find(session[:user_id]) if session[:user_id]
  	end
end
