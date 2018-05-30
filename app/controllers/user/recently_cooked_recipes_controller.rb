class User::RecentlyCookedRecipesController < ApplicationController
  before_action :authenticate_user!

  def index
      @recipes = Recipe.includes(:recently_cooked_recipes).where(recently_cooked_recipes: { user_id: current_user.id}).page(params[:page]).reverse_order
      @recentlyAddedToList = RecentlyCookedRecipe.where(user_id: current_user.id)
  end

  def create
  	recipe = RecentlyCookedRecipe.new(recipe_id: session[:recipe_id])
  	session[:recipe_id] = nil
  	recipe.user_id = current_user.id
  	recipe.save
    redirect_to shopping_list_path(current_user)
  end

  def destroy
  	recipe = RecentlyCookedRecipe.find(params[:id])
  	recipe.destroy
    redirect_to shopping_list_path(current_user)
  end

end
