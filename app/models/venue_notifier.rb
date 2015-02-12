class VenueNotifier
  def workshop_proposed_by_expert(workshop)
    unless workshop.venue.nil?
      #puts "workshop_proposed_by_expert #{workshop}"
      VenueMailer.workshop_proposed_by_expert(workshop).deliver
    end
  end

  def workshop_proposed_with_reservation(workshop)
    #puts "workshop_proposed_with_reservation #{workshop}"
    VenueMailer.workshop_proposed_with_reservation(workshop).deliver
  end

  def accepted_by_venue(workshop)
    #puts "accepted_by_venue #{workshop}"
    VenueMailer.accepted_by_venue(workshop).deliver
  end

  def workshop_has_been_given(workshop)
    #puts "workshop_has_been_given #{workshop}"
    VenueMailer.workshop_has_been_given(workshop).deliver
  end

  def workshop_cancelled_by_expert(workshop)
    #puts "workshop_cancelled_by_expert #{workshop}"
    VenueMailer.workshop_cancelled_by_expert(workshop).deliver
  end

  def workshop_revoked_by_venue(workshop)
    #puts "workshop_revoked_by_venue #{workshop}"
    VenueMailer.workshop_revoked_by_venue(workshop).deliver
  end

  def workshop_posposed_by_expert(workshop)
    #puts "workshop_posposed_by_expert #{workshop}"
    VenueMailer.workshop_posposed_by_expert(workshop).deliver
  end

  def reservation_updated(venue,former_workshop)
    VenueMailer.reservation_updated(venue,former_workshop).deliver
  end

end
