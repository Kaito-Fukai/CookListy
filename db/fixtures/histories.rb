require 'csv'

csv = CSV.read('db/fixtures/history.csv')

csv.each_with_index do |his, i|
	next if i === 0

	user_id				=	his[0]
	recipe_id 			=	his[1]

	History.seed do |s|
		s.id   				=	i
		s.user_id 			=	user_id
		s.recipe_id 		=	recipe_id
	end
end