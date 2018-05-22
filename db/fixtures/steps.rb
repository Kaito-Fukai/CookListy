require 'csv'

csv = CSV.read('db/fixtures/step.csv')

csv.each_with_index do |step, i|
	next if i === 0

	recipe_id			=	step[0]
	steps_expression	=	step[1]
	steps_order			=	step[2]


	Step.seed do |s|
		s.id   				=	i
		s.recipe_id 		=	recipe_id
		s.steps_expression 	=	steps_expression
		s.steps_order		=	steps_order
	end
end