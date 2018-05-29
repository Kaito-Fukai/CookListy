class Admin::MyRecipesController < ApplicationController
	before_action :authenticate_administrator!

  def index
  	@recipes = Recipe.where(user_id: params[:id]).page(params[:page]).reverse_order
  end

  def new
  end

  def edit
  end

  def show
  end
end
