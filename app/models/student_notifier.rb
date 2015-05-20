class StudentNotifier 
  
  
  
  
  
  def workshop_cancelled_by_expert(workshop) 
    #puts "workshop_cancelled_by_expert #{workshop}"
    StudentMailer.workshop_cancelled_by_expert.deliver_now
  end
  
  def workshop_has_been_given(workshop)
    #puts "workshop_has_been_given #{workshop}"
    workshop.students.each do |student|
      StudentMailer.workshop_has_been_given(workshop,student).deliver_now
    end
  end
  
  def workshop_revoked_by_venue(workshop)
    #puts "workshop_revoked_by_venue #{workshop}"
    StudentMailer.workshop_revoked_by_venue.deliver_now
  end
    
  def workshop_posposed_by_expert(workshop)
    #puts "workshop_posposed_by_expert #{workshop}"
    StudentMailer.workshop_posposed_by_expert.deliver_now
  end
  
  def enrollment_created(enrollment)
    #puts "enrollment_created #{enrollment}"
    StudentMailer.enrollment_created(enrollment).deliver_now
  end
  
  def enrollment_destroyed(enrollment)
    #puts "enrollment_destroyed #{enrollment}"
    StudentMailer.enrollment_destroyed(enrollment).deliver_now
  end
  
  def reservation_updated(former_workshop)
    #puts "---reservation_updated #{former_workshop.students.count}"
    
    former_workshop.students.each do |student| 
      StudentMailer.reservation_updated(student, former_workshop).deliver_now
    end
  end
  
end
