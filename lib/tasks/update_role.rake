
desc "Update password "
task :update_role, [:email, :role, :do] => [:environment] do |t, args|
	
	
	user = User.find_by(:email => args[:email])
	if user
		if (args[:do] == "update")
			if args[:role] == "admin"
				admin = Administrator.find_by(:user_id => user.id)
				if not admin
					user.create_administrator
				end
			elsif args[:role] == "moderator"
				mode = Moderator.find_by(:user_id => user.id)
				if not mode
					user.create_moderator
				end
			else
				puts "No existe el rol: " + args[:role]
			end
		elsif (args[:do] == "delete")
			if args[:role] == "admin"
				admin = Administrator.find_by(:user_id => user.id)
				if admin
					admin.destroy
				end
			elsif args[:role] == "moderator"
				mode = Moderator.find_by(:user_id => user.id)
				if mode
					mode.destroy
				end
			else
				puts "No existe el rol: " + args[:role]
			end
		else
			puts "Espesificar tarea ( update o delete )"	
		end
	else
		puts "El usuario con email "+ args[:email] +" no existe"	
	
	end

end
