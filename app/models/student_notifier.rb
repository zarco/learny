class StudentNotifier 
  
  
  
  
  
  def workshop_cancelled_by_expert(workshop) 
    #puts "workshop_cancelled_by_expert #{workshop}"
    StudentMailer.workshop_cancelled_by_expert.deliver
  end
  
  def workshop_has_been_given(workshop)
    #puts "workshop_has_been_given #{workshop}"
    StudentMailer.workshop_has_been_given.deliver
  end
  
  def workshop_revoked_by_venue(workshop)
    #puts "workshop_revoked_by_venue #{workshop}"
    StudentMailer.workshop_revoked_by_venue.deliver
  end
    
  def workshop_posposed_by_expert(workshop)
    #puts "workshop_posposed_by_expert #{workshop}"
    StudentMailer.workshop_posposed_by_expert.deliver
  end
  
  def enrollment_created(enrollment)
    #puts "enrollment_created #{enrollment}"
    StudentMailer.enrollment_created.deliver
  end
  
  def enrollment_destroyed(enrollment)
    #puts "enrollment_destroyed #{enrollment}"
    StudentMailer.enrollment_destroyed.deliver
  end
  
  def reservation_updated(former_workshop)
    puts "reservation_updated #{former_workshop.students}"
    #StudentMailer.reservation_updated
  end
  
end
