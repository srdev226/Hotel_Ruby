module ApplicationHelper

	def super_admin user
		user.type == "Super_Admin"
	end
end
