require 'csv'

csv = CSV.read('db/fixtures/user.csv')

csv.each_with_index do |user, i|
	next if i === 0

	email				=	user[0]
	password 			=	user[1]
	last_name			=	user[2]
	first_name			=	user[3]
	last_name_kana		=	user[4]
	first_name_kana		=	user[5]
	retire_flag			=	user[6]
	helper_name_1		=	user[7]
	helper_address_1	=	user[8]


	User.seed do |s|
		s.id   				=	i
		s.email 			=	email
		s.password 			=	password
		s.last_name			=	last_name
		s.first_name		=	first_name
		s.last_name_kana	=	last_name_kana
		s.first_name_kana	=	first_name_kana
		s.retire_flag		=	retire_flag
		s.helper_name_1		=	helper_name_1
		s.helper_address_1	=	helper_address_1
	end
end