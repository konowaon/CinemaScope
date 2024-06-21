class Admin::SessionsController < Devise::SessionsController
  layout 'admin'

  # def create
  #   if params[:email] == 'admin@example.com' && params[:password] == 'password'
  #     session[:admin_id] = true
  #     redirect_to admin_root_path, notice: 'ログインに成功しました。'
  #   else
  #     flash.now[:alert] = 'メールアドレスまたはパスワードが違います。'
  #     render :new
  #   end
  # end

  # def new
  #   self.resource = Admin.new
  # end

  def destroy
    super
  end

  protected

  def after_sign_in_path_for(resource)
    admin_movies_path # ログイン後に遷移するパス
  end

  # def auth_options
  #   { scope: resource_name, recall: "#{controller_path}#new" }
  # end
end