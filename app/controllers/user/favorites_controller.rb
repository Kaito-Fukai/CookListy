class User::FavoritesController < ApplicationController
  before_action :authenticate_user!

  def index
    f = Favorite.where(user_id: current_user.id)
    @recipes = Recipe.where(id: f)
  end

  def new
  end

  def create
  	@new_favorite = Favorite.new(recipe_id: params[:recipe_id])
  	@new_favorite.user_id = current_user.id
  	@new_favorite.save
  	redirect_to favorites_path
  end

  def destroy
    favorite = Favorite.find(params[:id])
    favorite.destroy
    redirect_to favorites_path
  end

end
