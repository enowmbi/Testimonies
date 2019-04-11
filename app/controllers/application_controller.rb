class ApplicationController < ActionController::Base
   before_action :configure_permitted_parameters,if: :devise_controller?

  protected
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up,keys: [:name])
    devise_parameter_sanitizer.permit(:sign_up,keys: [:phone])
    devise_parameter_sanitizer.permit(:sign_up,keys: [:address])
    devise_parameter_sanitizer.permit(:sign_up,keys: [:city])
    devise_parameter_sanitizer.permit(:sign_up,keys: [:state])
    devise_parameter_sanitizer.permit(:sign_up,keys: [:country_id])
    devise_parameter_sanitizer.permit(:sign_up,keys: [:is_admin])


    devise_parameter_sanitizer.permit(:account_update,keys: [:name])
    devise_parameter_sanitizer.permit(:account_update,keys: [:phone])
    devise_parameter_sanitizer.permit(:account_update,keys: [:address])
    devise_parameter_sanitizer.permit(:account_update,keys: [:city])
    devise_parameter_sanitizer.permit(:account_update,keys: [:state])
    devise_parameter_sanitizer.permit(:account_update,keys: [:country_id])
    devise_parameter_sanitizer.permit(:account_update,keys: [:is_admin])
  end
end
