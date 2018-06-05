class User::FavoritesController < ApplicationController
  before_action :authenticate_user!

  def index
    @recipes = Recipe.includes(:favorites).where(favorites: { user_id: current_user.id }).page(params[:page]).reverse_order
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
    favorite = Favorite.where(recipe_id: params[:id]).where(user_id: current_user.id)
    favorite.destroy_all
    redirect_to favorites_path
  end

end
