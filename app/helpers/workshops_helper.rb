module WorkshopsHelper
	def random_workshop
	  
	  #puts ">>>> #{Workshop.count}"
	  
	  workshop=Workshop.select(:name).limit(1).order("random()").first
		workshop.nil? ? '' : workshop.name		
	end
end
