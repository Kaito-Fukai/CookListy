class User::MyRecipesController < ApplicationController
  before_action :authenticate_user!

	def index
		@recipes = Recipe.where(user_id: current_user.id).page(params[:page]).reverse_order
	end

	def show
		@recipe = Recipe.find(params[:id])
	end

	def new
		@recipe = Recipe.new
		if  params[:recipe_id] == nil
			@recipe.recipe_tags.build
			1.times do
				@recipe.ingredient_recipes.build
			end

			1.times do
				@recipe.steps.build
			end
		else
			@recipe = Recipe.find(params[:recipe_id])
		end
	end

	def edit
		@recipe  = Recipe.find(params[:id])
		@tags = Tag.all
	end

	def update
		my_recipe = Recipe.find(params[:id])
		my_recipe.update(recipe_params)

		RecipeTag.where(recipe_id: params[:id]).destroy_all
		tags = params[:recipe][:recipe_tags_attributes]
		tags.each do |tag|
			t = tags[tag]
			my_recipe.recipe_tags.new(tag_id: t["tag_id"][1]).save! unless t["tag_id"][1] == nil || t["_destroy"] == '1'
		end

		IngredientRecipe.where(recipe_id: params[:id]).destroy_all
		ingredients = params[:recipe][:ingredient_recipes_attributes]
		ingredients.each do |ingredient|
			i = ingredients[ingredient]
			my_recipe.ingredient_recipes.new(ingredient_id: i["ingredient_id"], quantity: i["quantity"]).save! unless i["_destroy"] == '1'
		end

		Step.where(recipe_id: params[:id]).destroy_all
		steps = params[:recipe][:steps_attributes]
		steps.each do |step|
			s = steps[step]
			my_recipe.steps.new(steps_order: s["steps_order"], steps_expression: s["steps_expression"]).save! unless s["_destroy"] == '1'
		end

		redirect_to my_recipe_path(params[:id])
	end

	def destroy
		my_recipe = Recipe.find(params[:id])
		my_recipe.destroy
		redirect_to my_recipes_path
	end

	def new_create #完全新規レシピ専用のcreateアクション
	end

	def create #既存レシピのアレンジ時専用のcreateアクション
		@recipe  = Recipe.new(recipe_params)
		@recipe.user_id = current_user.id
		@recipe.save!

		tags = params[:recipe][:recipe_tags_attributes]
		tags.each do |tag|
			t = tags[tag]
			@recipe.recipe_tags.new(tag_id: t["tag_id"][1]).save! unless t["tag_id"][1] == nil || t["_destroy"] == '1'
		end

		ingredients = params[:recipe][:ingredient_recipes_attributes]
		ingredients.each do |ingredient|
			i = ingredients[ingredient]
			@recipe.ingredient_recipes.new(ingredient_id: i["ingredient_id"], quantity: i["quantity"]).save! unless i["_destroy"] == '1'
		end

		steps = params[:recipe][:steps_attributes]
		steps.each do |step|
			s = steps[step]
			@recipe.steps.new(steps_order: s["steps_order"], steps_expression: s["steps_expression"]).save! unless s["_destroy"] == '1'
		end

		redirect_to my_recipes_path
	end


	private
	def recipe_params
		params.require(:recipe).permit(
										:id,
										:recipe_name,
										:memo,
										:image,
										:user_id,
										:admin_id
										)
	end
		# params.require(:recipe).permit(
		# 	:id,
		# 	:recipe_name,
		# 	:memo,
		# 	:image,
		# 	:user_id,
		# 	:admin_id,
		# 	ingredient_recipes_attributes: [:id, :recipe_id, :ingredient_id, :quantity],
		# 	steps_attributes: [:id, :recipe_id, :steps_expression, :steps_order]
		# 	)



			# ingredient_recipes_attributes: [:id, :recipe_id, :ingredient_id, :quantity],
			# steps_attributes: [:id, :recipe_id, :steps_expression, :steps_order]
		# a = recipe_tags_attributes: [:id, :recipe_id, tag_id:[] ]

end

# 逃がしたcreateアクション tag入力boxに複数入力→新規作成には使えそう
	# def create
	# 	@recipe  = Recipe.new(recipe_params)
	# 	@recipe.admin_id = 1
	# 	@recipe.save!

	# 	tags = params[:recipe][:recipe_tags_attributes]["0"]["tag_id"].from(1)
	# 	tags.each do |tag|
	# 		newTag = @recipe.recipe_tags.new(tag_id: tag.to_i)
	# 		newTag.save!
	# 	end

	# 	ingredients = params[:recipe][:ingredient_recipes_attributes]
	# 	ingredients.each do |ingredient|
	# 		i = ingredients[ingredient]
	# 		@recipe.ingredient_recipes.new(ingredient_id: i["ingredient_id"], quantity: i["quantity"]).save
	# 	end

	# 	steps = params[:recipe][:steps_attributes]
	# 	steps.each do |step|
	# 		s = steps[step]
	# 		@recipe.steps.new(steps_order: s["steps_order"], steps_expression: s["steps_expression"]).save
	# 	end

	# 	redirect_to my_recipes_path
	# end

