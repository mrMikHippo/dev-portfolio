module CurrentUserConcern
	extend ActiveSupport::Concern

	def current_user
		super || guest_user
	end

	def guest_user
		guest = GuestUser.new
		guest.name = "Guest User"
		guest.first_name = guest.name.split.first
		guest.last_name = guest.name.split.last
		guest.email = "guest@example.com"
		# return guest
		guest 
	end
end