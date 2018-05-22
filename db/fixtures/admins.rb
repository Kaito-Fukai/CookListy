require 'csv'

csv = CSV.read('db/fixtures/admin.csv')

csv.each_with_index do |admin, i|
	next if i === 0

	email				=	admin[1]
	password 			=	admin[2]
	name				=	admin[3]

	Administrator.seed do |s|
		s.id   				=	i
		s.email 			=	email
		s.password 			=	password
		s.name				=	name
	end
end