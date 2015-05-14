module WorkshopsHelper
	def random_workshop
	  
	  #puts ">>>> #{Workshop.count}"
	  
	  workshop=Workshop.select(:name).limit(1).order("random()").first
		workshop.nil? ? '' : workshop.name		
	end

	def small_description_profile(description,total_words=300)
    	truncate(description,length: total_words,separator: ' ')
  	end

  	def count_workshops
  		Workshop.count
  	end
end
