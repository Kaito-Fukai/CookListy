require 'csv'

csv = CSV.read('db/fixtures/helper.csv')

csv.each_with_index do |h, i|
	next if i === 0

	name			=	h[1]
	address 		=	h[2]
	user_id			=	h[3]

	Helper.seed do |s|
		s.id   			=	i
		s.name 			=	name
		s.address 		=	address
		s.user_id		=	user_id
	end
end