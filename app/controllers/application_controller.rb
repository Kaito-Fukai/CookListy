class ApplicationController < ActionController::Base
  before_action :ransack
  protect_from_forgery with: :exception

  def ransack
  	@q = Recipe.ransack(params[:q])
  end


  private
  def search_params
  	params.require(:q).permit!
  end
end
