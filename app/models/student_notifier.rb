class StudentNotifier 
  
  
  
  
  
  def workshop_cancelled_by_expert(workshop) 
    puts "workshop_cancelled_by_expert #{workshop}"
  end
  
  def workshop_has_been_given(workshop)
    puts "workshop_has_been_given #{workshop}"
  end
  
  def workshop_revoked_by_venue(workshop)
    puts "workshop_revoked_by_venue #{workshop}"
  end
    
  def workshop_posposed_by_expert(workshop)
    puts "workshop_posposed_by_expert #{workshop}"
  end
  
  def enrollment_created(enrollment)
    puts "enrollment_created #{enrollment}"
  end
  
  def enrollment_destroyed(enrollment)
    puts "enrollment_destroyed #{enrollment}"
    
  end
  
  def reservation_updated(former_workshop)
    puts "reservation_updated #{former_workshop.students}"
  end
  
end
