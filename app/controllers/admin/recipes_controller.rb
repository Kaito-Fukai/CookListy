class Admin::RecipesController < ApplicationController
	before_action :recipe_find, only: [:show, :edit]
	before_action :authenticate_administrator!

	def index
		@recipes = Recipe.page(params[:page]).reverse_order
	end

	def show
		@recipe  = Recipe.find(params[:id])
	end

	def edit
		@recipe  = Recipe.find(params[:id])
	end

	def update
		recipe = Recipe.find(params[:id])
		recipe.update(update_recipe_params)
		# 該当レシピのタグを全て削除する
		# RecipeTag.where(recipe_id: params[:id]).destroy_all

		# # tag_idが送信された分だけ新しくRecipeTagをcreateする
		# if params[:recipe][:recipe_tags_attributes] =! nil
		# 	tags = params[:recipe][:recipe_tags_attributes]
		# 	tags.each do |tag|
		# 		t = tags[tag]
		# 		recipe.recipe_tags.create(tag_id: t["tag_id"][1]) unless t["tag_id"][1] == nil
		# 	end
		# end

		redirect_to admin_recipe_path(recipe)
	end

	def new
		@recipe  = Recipe.new
		@recipe.recipe_tags.build
		@recipe.ingredient_recipes.build
		@recipe.steps.build
	end

	def create
		@recipe  = Recipe.new(create_recipe_params)
		@recipe.administrator_id = current_administrator.id
		@recipe.save!

		tags = params[:recipe][:recipe_tags_attributes]["0"]["tag_id"].from(1)
		tags.each do |tag|
			newTag = @recipe.recipe_tags.new(tag_id: tag.to_i)
			newTag.save!
		end

		redirect_to admin_recipes_path
	end

	def destroy
		recipe = Recipe.find(params[:id])
		recipe.destroy
		redirect_to admin_recipes_path
	end

	private

		def recipe_find
			@recipe = Recipe.find(params[:id])
		end

		def create_recipe_params
			params.require(:recipe).permit(
				:id,
				:recipe_name,
				:memo,
				:image,
				:user_id,
				:admin_id,
				ingredient_recipes_attributes: [:id, :recipe_id, :ingredient_id, :quantity, :_destroy],
				steps_attributes: [:id, :recipe_id, :steps_expression, :steps_order,  :_destroy],
				)
				# recipe_tags_attributes: [:id, :recipe_id, :tag_id,  :_destroy]
		end

		def update_recipe_params
			params.require(:recipe).permit(
				:id,
				:recipe_name,
				:memo,
				:image,
				:user_id,
				:admin_id,
				ingredient_recipes_attributes: [:id, :recipe_id, :ingredient_id, :quantity, :_destroy],
				steps_attributes: [:id, :recipe_id, :steps_expression, :steps_order,  :_destroy],
				recipe_tags_attributes: [:id, :recipe_id, :tag_id, :_destroy]
				)
		end

end