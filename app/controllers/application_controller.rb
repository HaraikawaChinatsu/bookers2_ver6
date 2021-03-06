class ApplicationController < ActionController::Base

  protect_from_forgery with: :null_session

def after_sign_in_path_for(resource)
    user_path(current_user)
end

 # before_action :authenticate_user!
 # コントローラーに設定して、ログイン済ユーザーのみにアクセスを許可する
 before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
  end

end
