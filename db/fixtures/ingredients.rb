require 'csv'

csv = CSV.read('db/fixtures/ingredient.csv')

csv.each_with_index do |ing, i|
	next if i === 0

	name				=	ing[0]
	name_kana 			=	ing[1]
	name_with_unit 		=	ing[2]
	unit_id				=	ing[3]
	specific_gravity 	=	ing[4]
	unit_in_lists 		=	ing[5]
	category 			=	ing[6]
	basic_unit_flag		=	ing[7]

	Ingredient.seed do |s|
		s.id   				=	i
		s.name 				=	name
		s.name_kana 		=	name_kana
		s.name_with_unit 	=	name_with_unit
		s.unit_id	 		=	unit_id
		s.specific_gravity 	=	specific_gravity
		s.unit_in_lists 	=	unit_in_lists
		s.category 			=	category
		s.basic_unit_flag	=	basic_unit_flag
	end
end