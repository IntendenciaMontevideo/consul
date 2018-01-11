
desc "Update password "
task :update_password, [:email, :update_password] => [:environment] do |t, args|
	
	#user = User.find_by(email: args[:email]).reset_password!(args[:update_password],args[:update_password])
	#user = User.where(email: args[:email])
	
	#user.update_attribute(password: 123)
	puts args[:email]
	u=User.find_by(:email => args[:email])
	if u
		u.password = args[:update_password]
		u.password_confirmation = args[:update_password]
		#print encript
		ret = u.save!
		puts ret
	end
	

end
