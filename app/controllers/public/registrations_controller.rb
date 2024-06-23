# app/controllers/users/registrations_controller.rb
class Public::RegistrationsController < Devise::RegistrationsController
  # 登録時と更新時の許可パラメータを設定するメソッドを実行
  before_action :configure_permitted_parameters

  protected
# 許可パラメータを設定するメソッド
  def configure_permitted_parameters
    # サインアップ時にusernameとroleを許可
    devise_parameter_sanitizer.permit(:sign_up, keys: [:username, :role])
    # アカウント更新時にusernameとroleを許可
    devise_parameter_sanitizer.permit(:account_update, keys: [:username, :role])
  end
# サインアップ後のリダイレクト先を設定するメソッド
  def after_sign_up_path_for(resource)
    root_path # リダイレクト先をルートパスに設定（任意のパスに変更可能）
  end
# アカウント更新後のリダイレクト先を設定するメソッド
  def after_update_path_for(resource)
    user_path(resource) # プロフィール更新後のリダイレクト先
  end
end