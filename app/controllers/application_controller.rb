class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :authenticate_user!

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [profile_attributes: [:name]])
    devise_parameter_sanitizer.permit(:sign_up, keys: [affiliations_attributes: [:division_id]])
    devise_parameter_sanitizer.permit(:account_update, keys: [profile_attributes: [:id, :name, :hire_date, :job]])
    devise_parameter_sanitizer.permit(:account_update, keys: [affiliations_attributes: [:id, :division_id]])
  end
end
