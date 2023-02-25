# frozen_string_literal: true

class Users::SessionsController < Devise::SessionsController
  
  def after_sign_in_path_for(resource)
    profiles_path
  end 

  def after_sign_out_path_for(resource)
    menu_tops_path
  end 

  def new_guest
    user = User.guest
    sign_in user
    redirect_to profiles_path, notice: t('view.guests.login')
  end

  def new_admin_guest
    user = User.admin_guest
    sign_in user
    if user.roles.first.try(:name) == "admin"
      redirect_to profiles_path, notice: t('view.guests.admin_login')
    else
      user.roles << Role.find_by(name: 'admin')
      redirect_to profiles_path, notice: t('view.guests.admin_login')
    end
  end
  # GET /resource/sign_in
  # def new
  #   super
  # end

  # POST /resource/sign_in
  # def create
  #   super
  # end

  # DELETE /resource/sign_out
  # def destroy
  #   super
  # end

  # protected

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_sign_in_params
  #   devise_parameter_sanitizer.permit(:sign_in, keys: [:attribute])
  # end
end
