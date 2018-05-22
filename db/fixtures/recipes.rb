require 'csv'

csv = CSV.read('db/fixtures/recipe.csv')

csv.each_with_index do |rt, i|
	next if i === 0

	recipe_name 			=	rt[0]
	memo					=	rt[1]
	user_id					=   rt[3]
	administrator_id		=	rt[4]

	Recipe.seed do |s|
		s.id   				=	i
		s.recipe_name 		=	recipe_name
		s.memo 				=	memo
		s.user_id			=	user_id
		s.administrator_id	=	administrator_id
	end
end