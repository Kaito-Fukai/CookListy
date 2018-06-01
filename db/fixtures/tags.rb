require 'csv'

csv = CSV.read('db/fixtures/tag.csv')

csv.each_with_index do |tag, i|
	next if i === 0

	word 			=	tag[0]
	category_id		=	tag[1]


	Tag.seed do |s|
		s.id   			=	i
		s.word 			=	word
		s.category_id	 	=	category_id
	end
end