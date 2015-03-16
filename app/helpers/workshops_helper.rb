module WorkshopsHelper
	def random_workshop
		hint_workshop = Workshop.select(:name).limit(1).order("random()").first
		hint_workshop_name = hint_workshop.nil? ? "surf" : hint_workshop.name
		"Clases de " << hint_workshop_name
	end

	def small_description_profile(description,total_words=300)
    	description_visible = description.truncate(total_words,separator: ' ')
  	end
end
