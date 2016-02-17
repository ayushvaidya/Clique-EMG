class RegistrationsController < Devise::RegistrationsController
  before_filter :configure_permitted_parameters

  def create
    if verify_recaptcha
     super
    else
     build_resource(sign_up_params)
     clean_up_passwords(resource)
     flash.now[:alert] = "reCAPTCHA Failed."
     flash.delete :recaptcha_error
     render :new
    end
  end
  # --------------------------- Overrides --------------------------------------
  private
  def after_inactive_sign_up_path_for(resource)
    new_user_session_path
  end
  protected
  def configure_permitted_parameters
    devise_parameter_sanitizer.for(:sign_up).push(:name, :first_name, :last_name)
  end
end
