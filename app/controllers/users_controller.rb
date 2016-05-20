class UsersController < ApplicationController
  layout 'marketing'

  def new
    @user = User.new
  end

  def create
    @user = User.new user_params
    if @user.save
      log_in @user
      redirect_to root_url(subdomain: 'app'), flash: { success: "Welcome to Something TO-DO!"}
    else
      render :new
    end
  end

  private

    def user_params
      params.require(:user).permit(:name, :email, :password, :password_confirmation)
    end
end
