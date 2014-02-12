factory :email, class: OpenStruct do
	#Assumes Griddler.configure.to is :hash (default)
	to [{ full: 'to_user@email.com', email: 'to_user@email.com', token: 'to_user', host: 'email.com', name: nil}]	
	from 'user@email.com'
	subject 'email subject'
	body 'Hello!'

end