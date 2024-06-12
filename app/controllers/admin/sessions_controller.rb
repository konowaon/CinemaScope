class Admin::SessionsController < Devise::SessionsController
  layout 'admin'

  def create
    admin_email = 'admin@example.com'
    admin_password = 'password'

    if params[:admin][:email] == admin_email && params[:admin][:password] == admin_password
      self.resource = warden.authenticate!(auth_options)
      set_flash_message!(:notice, :signed_in)
      sign_in(resource_name, resource)
      yield resource if block_given?
      respond_with resource, location: after_sign_in_path_for(resource)
    else
      flash.now[:alert] = 'Invalid email or password'
      render :new
    end
  end

  def new
    self.resource = Admin.new
  end

  def destroy
    super
  end

  protected

  def after_sign_in_path_for(resource)
    admin_movies_path # ログイン後に遷移するパス
  end

  def auth_options
    { scope: resource_name, recall: "#{controller_path}#new" }
  end
end