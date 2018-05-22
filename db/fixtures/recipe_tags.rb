require 'csv'

csv = CSV.read('db/fixtures/recipe_tag.csv')

csv.each_with_index do |rt, i|
	next if i === 0

	recipe_id 			=	rt[0]
	tag_id				=	rt[1]


	RecipeTag.seed do |s|
		s.id   			=	i
		s.recipe_id 	=	recipe_id
		s.tag_id 		=	tag_id
	end
end