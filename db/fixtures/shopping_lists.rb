require 'csv'

csv = CSV.read('db/fixtures/shopping_list.csv')

csv.each_with_index do |sl, i|
	next if i === 0

	user_id				=	sl[0]
	ingredient_id 		=	sl[1]
	quantity			=	sl[3]
	recipe_id			=	sl[4]

	ShoppingList.seed do |s|
		s.id   				=	i
		s.user_id 			=	user_id
		s.ingredient_id 	=	ingredient_id
		s.quantity			=	quantity
		s.recipe_id			=	recipe_id
	end
end