
desc "Create admin"
task :create_admin, [:username, :email, :password] => [:environment] do |t, args|
	#puts args[:username]
	exist_email = User.where(email: args[:email])
	exist_name = User.where(username: args[:username])
	if ((exist_email == []) and (exist_name == []))
		admin = User.create!(username: args[:username], email: args[:email], password: args[:password], password_confirmation: args[:password], confirmed_at: Time.current, terms_of_service: "1")
		admin.create_administrator
		puts "Usuario creado con exito"
	elsif (exist_email != [])
		puts "El usuario con mail "+ args[:email].to_s+" ya existe"
	else
		puts "El usuario con nombre "+ args[:username].to_s+" ya existe"
	end
end
