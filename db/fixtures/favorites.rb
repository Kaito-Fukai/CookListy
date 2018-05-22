require 'csv'

csv = CSV.read('db/fixtures/favorite.csv')

csv.each_with_index do |fav, i|
	next if i === 0

	user_id				=	fav[0]
	recipe_id 			=	fav[1]


	Favorite.seed do |s|
		s.id   				=	i
		s.user_id 			=	user_id
		s.recipe_id 		=	recipe_id
	end
end