require 'csv'

csv = CSV.read('db/fixtures/ingredient_recipe.csv')

csv.each_with_index do |ir, i|
	next if i === 0

	recipe_id			=	ir[0]
	ingredient_id 		=	ir[1]
	quantity 			=	ir[2]


	IngredientRecipe.seed do |s|
		s.id   				=	i
		s.recipe_id			=	recipe_id
		s.ingredient_id 	=	ingredient_id
		s.quantity			=	quantity
	end
end