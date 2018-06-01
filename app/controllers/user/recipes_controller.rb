class User::RecipesController < ApplicationController
		def search
			@q = Recipe.where(user_id: nil).search(search_params) # マイレシピ（＝user_idを持つレコード）以外の全レシピから検索
			@recipes = @q.result(distinct: true).page(params[:page])
		    @word = params[:q]["recipe_name_cont"]
		end

		def tagSearch
			@recipes_count = Recipe.includes(:recipe_tags).where(recipe_tags: { tag_id: params[:tag_id]})
			@recipes = @recipes_count.page(params[:page])
		    @word = Tag.find(params[:tag_id]).word
		end

		def index
			@new_favorite = Favorite.new
			@recipes = Recipe.where(user_id: nil).page(params[:page])
			@tags = TagCategory.all
		end

		def show
			@recipe = Recipe.find(params[:id])
		end

	private
		def search_params
			params.require(:q).permit!
		end

end
