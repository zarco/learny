module WorkshopsHelper
	def random_workshop
		Workshop.select(:name).limit(1).order("random()").first.name		
	end
end
