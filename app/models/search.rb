class Search < ActiveRecord::Base
	def self.save_search(student, expert, venue, term)
		term.strip!
		unless term.empty?
			if student
				Search.create(:term => term, :actor => 'student', :id_actor => student.id)
			elsif expert
				Search.create(:term => term, :actor => 'expert', :id_actor => expert.id)
			elsif venue
				Search.create(:term => term, :actor => 'venue', :id_actor => venue.id)
			else
				Search.create(:term => term, :actor => 'guest')
			end		
		end
	end
end
