# app/controllers/users/registrations_controller.rb
class Public::RegistrationsController < Devise::RegistrationsController
  before_action :configure_permitted_parameters

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:username, :role])
    devise_parameter_sanitizer.permit(:account_update, keys: [:username, :role])
  end

  def after_sign_up_path_for(resource)
    root_path # 任意のパスに変更
  end

  def after_update_path_for(resource)
    user_path(resource) # プロフィール更新後のリダイレクト先
  end
end