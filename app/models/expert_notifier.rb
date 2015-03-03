class ExpertNotifier
  def workshop_proposed_by_expert(workshop)
    #puts "workshop_proposed_by_expert #{workshop}"
    ExpertMailer.workshop_proposed_by_expert.deliver_now
  end

  def workshop_proposed_with_reservation(workshop)
    #puts "workshop_proposed_with_reservation #{workshop}"
    ExpertMailer.workshop_proposed_with_reservation.deliver_now
  end

  def accepted_by_venue(workshop)
    #puts "accepted_by_venue #{workshop}"
    ExpertMailer.accepted_by_venue.deliver_now
  end

  def workshop_has_been_given(workshop)
    #puts "workshop_has_been_given #{workshop}"
    ExpertMailer.workshop_has_been_given.deliver_now
  end

  def workshop_cancelled_by_expert(workshop)
    #puts "workshop_cancelled_by_expert #{workshop}"
    ExpertMailer.workshop_cancelled_by_expert.deliver_now
  end

  def workshop_revoked_by_venue(workshop)
    #puts "workshop_revoked_by_venue #{workshop}"
    ExpertMailer.workshop_revoked_by_venue.deliver_now
  end

  def workshop_posposed_by_expert(workshop)
    #puts "workshop_posposed_by_expert #{workshop}"
    ExpertMailer.workshop_posposed_by_expert.deliver_now
  end

  def enrollment_created(enrollment)
    ExpertMailer.enrollment_created(enrollment).deliver_now
  end

  def enrollment_destroyed(enrollment)
    ExpertMailer.enrollment_destroyed(enrollment).deliver_now 
  end

end
