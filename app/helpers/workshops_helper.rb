module WorkshopsHelper
	def random_workshop
		hint_workshop = Workshop.select(:name).limit(1).order("random()")
		hint_workshop_name = hint_workshop.nil? ? "surf" : hint_workshop[0].name
		"Clases de " << hint_workshop_name
	end
end
