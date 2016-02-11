class SessionsController < ApplicationController
	def new
	end

	def create
		user = User.where(:name => params[:signin][:name]).first

		if user && user.authenticate(params[:signin][:password])
			session[:user_id] = user.id
			flash[:notice] = I18n.t("users._sign_in_success")
			
			redirect_to root_url
		else
			flash[:error] = I18n.t("users._sign_in_fail")
			render :new
		end
	end
end