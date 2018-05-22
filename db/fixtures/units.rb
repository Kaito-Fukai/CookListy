require 'csv'

csv = CSV.read('db/fixtures/unit.csv')

csv.each_with_index do |unit, i|
	next if i === 0

	unit_name		=	unit[1]
	cc				=	unit[2]
	prepositive		=	unit[3]


	Unit.seed do |s|
		s.id   			=	i
		s.unit_name 	=	unit_name
		s.cc	 		=	cc
		s.prepositive	=	prepositive
	end
end