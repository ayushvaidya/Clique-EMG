class PasswordsController < ApplicationController
  def create
    if verify_recaptcha
     super
    else
     flash[:alert] = "reCAPTCHA Failed."
     redirect_to action: 'new'
    end
  end

  def new
    @resource = User.new
    @resource_class = "user"
  end

  def edit
    @user = current_user
  end

  def update
    @user = current_user
    # raise params.inspect
    if @user.update_with_password(password_params)
      flash[:notice] = "Your Password has been updated!"
      sign_in(@user, :bypass => true)
      redirect_to root_path
    else
      flash[:alert] = "An Error has occured"
      redirect_to root_path
    end
  end

  private
  def password_params
    params.require(:user).permit(:user, :reset_password_token, :current_password, :password, :password_confirmation)
  end
end
