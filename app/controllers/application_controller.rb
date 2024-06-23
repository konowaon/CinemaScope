class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?
  
  protected
# Deviseでサインアップやアカウント更新時に許可するパラメータ
  def configure_permitted_parameters
    # サインアップ時に許可するパラメータに`username`と`role`を追加
    devise_parameter_sanitizer.permit(:sign_up, keys: [:username, :role])
    # アカウント更新時に許可するパラメータに`username`と`role`を追加
    devise_parameter_sanitizer.permit(:account_update, keys: [:username, :role])
  end
end
