class ApplicationController < ActionController::Base
  before_action :authenticate_user!,expect: [:top]
  # ログインしていない状態だと、ログイン画面へ遷移する。しかし、expectによって、top画面へはログイン状態に関わらずアクセス可能！
  before_action :configure_permitted_parameters, if: :devise_controller?
  
  def after_sign_in_path_for(resource)
    post_images_path
  end
  # 上記のメソッドは、ログイン、ログアウト後は投稿一覧画面へ遷移するようにしているやつ。

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
  end
end
