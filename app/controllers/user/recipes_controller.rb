class User::RecipesController < ApplicationController
		def search
			@q = Recipe.where(user_id: nil).search(search_params) # マイレシピ（＝user_idを持つレコード）以外の全レシピから検索
			@recipes = @q.result(distinct: true)
		    @word = params[:q]["recipe_name_cont"]
		end

		def index
			@new_favorite = Favorite.new
			@recipes = Recipe.where(user_id: nil)
			@tags = Tag.all
		end

		def show
			@recipe = Recipe.find(params[:id])
		end

	private
		def search_params
			params.require(:q).permit!
		end

end
