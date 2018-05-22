class User::RootController < ApplicationController
    before_action :ransack
  def top
  end

  def ransack
  	@q = Recipe.ransack(params[:q])
  end


  private
  def search_params
  	params.require(:q).permit!
  end

end
