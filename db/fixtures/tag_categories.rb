require 'csv'

csv = CSV.read('db/fixtures/tag_category.csv')

csv.each_with_index do |category, i|
	next if i === 0

	name 			=	category[1]

	TagCategory.seed do |s|
		s.id   			=	i
		s.name			=	name
	end
end