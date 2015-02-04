class ExpertNotifier 
  
  def workshop_proposed_by_expert(workshop) 
    #puts "workshop_proposed_by_expert #{workshop}"
    ExpertMailer.workshop_proposed_by_expert.deliver
  end
  
  def workshop_proposed_with_reservation(workshop)
    #puts "workshop_proposed_with_reservation #{workshop}"
    ExpertMailer.workshop_proposed_with_reservation.deliver
  end
  
  def accepted_by_venue(workshop)
    #puts "accepted_by_venue #{workshop}"
    ExpertMailer.accepted_by_venue.deliver  
  end
  
  def workshop_has_been_given(workshop)
    #puts "workshop_has_been_given #{workshop}"
    ExpertMailer.workshop_has_been_given.deliver
  end
  
  def workshop_cancelled_by_expert(workshop) 
    #puts "workshop_cancelled_by_expert #{workshop}"
    ExpertMailer.workshop_cancelled_by_expert.deliver
  end
  
  def workshop_revoked_by_venue(workshop)
    #puts "workshop_revoked_by_venue #{workshop}"
    ExpertMailer.workshop_revoked_by_venue.deliver
  end
    
  def workshop_posposed_by_expert(workshop)
    #puts "workshop_posposed_by_expert #{workshop}"
    ExpertMailer.workshop_posposed_by_expert.deliver
  end
  

  
  
end
