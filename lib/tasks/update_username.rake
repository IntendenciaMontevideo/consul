#How to run:
# rake update_username[email,new_username]

desc "Update username "
task :update_username, [:email, :update_username] => [:environment] do |t, args|
	
	#user = User.find_by(email: args[:email]).reset_password!(args[:update_password],args[:update_password])
	#user = User.where(email: args[:email])
	
	#user.update_attribute(password: 123)
	puts args[:email]
	u=User.find_by(:email => args[:email])
	if u
		u.username = args[:update_username]
		if u.save!
			puts "Nombre de usuario actualizado con exito"
		else
			puts "Error al actualizar el nombre de usuario con email: " + args[:email].to_s
		end

	end
end
