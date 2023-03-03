class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :authenticate_user!

  def admin
    current_user.roles.first.try(:name) == "admin"
  end

  def superior_new
    @user.taught.ids.include?(current_user.id)
  end

  def manager_new
    (current_user.roles.first.try(:name) == "manager" && @user.affiliation_divisions.exists?(id: current_user.affiliation_divisions.pluck(:id)))
  end
  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [profile_attributes: [:name]])
    devise_parameter_sanitizer.permit(:sign_up, keys: [affiliations_attributes: [:division_id]])
    devise_parameter_sanitizer.permit(:account_update, keys: [profile_attributes: %i(id name hire_date job)])
    devise_parameter_sanitizer.permit(:account_update, keys: [affiliations_attributes: %i(id division_id)])
  end
end
