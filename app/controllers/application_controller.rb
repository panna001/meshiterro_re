class ApplicationController < ActionController::Base
  before_action :confiqure_permitted_parameters, if: :devise_controller?
  before_action :authenticate_user!, except: [:top]
  def after_sign_in_path_for(resourse)
    post_images_path
  end


  protected

  def confiqure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
  end
end
