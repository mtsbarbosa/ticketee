class UsersController < ApplicationController
  before_action :set_user, only: [:show,
                                  :edit,
                                  :update]

  def new
  	@user = User.new
  end

  def create
  	@user = User.new(user_params)
  	if @user.save
  		flash[:notice] = I18n.t("users._sign_up_success")
  		redirect_to projects_path
  	else
  		render :new
  	end
  end

  def show
  end

  def edit
  end

  def update
    if @user.update(user_params)
      flash[:notice] = I18n.t("users._entity_updated_success")
      redirect_to @user
    else
      flash[:alert] = I18n.t("users._entity_updated_fail")
      render "edit"
    end
  end

  private
  	def user_params
  		params.require(:user).permit(:name,
  										:password,
  										:password_confirmation)
  	end

  private
    def set_user
      @user = User.find(params[:id])
    end
end
