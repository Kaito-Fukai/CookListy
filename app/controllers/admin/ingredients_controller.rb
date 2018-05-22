class Admin::IngredientsController < ApplicationController
  before_action :authenticate_administrator!

  def index
  	@q = Ingredient.ransack(params[:q])

  	@ingredients = Ingredient.all
  	@new = Ingredient.new
  	@units = Unit.select(:id).distinct
  end

  def search
  	@q = Ingredient.search(search_params)
  	@ingredients = @q.result(distinct: true)
    @word = params[:q]["word_cont"]

  	@new = Ingredient.new
	  @units = Unit.select(:id).distinct
  end

  def create
  	@ingredient = Ingredient.new(ingredient_params)
  	@ingredient.save
  	redirect_to admin_ingredients_path
  end

  def edit
    @q = Ingredient.ransack(params[:q])
    @ingredients = Ingredient.all
    @ingredient = Ingredient.find(params[:id])
  end

  def update
    @ingredient = Ingredient.find(params[:id])
    @ingredient.update(ingredient_params)
    redirect_to admin_ingredients_path
  end

  def destroy
    ingredient = Ingredient.find(params[:id])
    ingredient.destroy
    redirect_to admin_ingredients_path
  end

  private
	def ingredient_params
		params.require(:ingredient).permit(:name, :name_kana, :name_with_unit, :unit_id, :unit_in_lists, :category, :specific_gravity)
	end

	def search_params
		params.require(:q).permit!
	end

end
