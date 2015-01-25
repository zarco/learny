module ContactsHelper
	def setup_contact_venue(venue)
	    venue.contact ||= Contact.new
	    venue
	end
end
