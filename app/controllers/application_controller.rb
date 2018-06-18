class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :ransack
  before_action :configure_permitted_parameters, if: :devise_controller?

  def ransack
  	@q = Recipe.ransack(params[:q])
  end


  private
  def search_params
  	params.require(:q).permit!
  end

  def configure_permitted_parameters
  	devise_parameter_sanitizer.permit(:sign_up, keys: [:last_name, :first_name, :last_name_kana, :first_name_kana])
  end
end
