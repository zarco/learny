class VenueNotifier
  def workshop_proposed_by_expert(workshop)
    unless workshop.venue.nil?
      #puts "workshop_proposed_by_expert #{workshop}"
      VenueMailer.workshop_proposed_by_expert(workshop).deliver_now
    end
  end

  def workshop_proposed_with_reservation(workshop)
    #puts "workshop_proposed_with_reservation #{workshop}"
    #Descomentar cuando el factory de workshop cree un venue
    #VenueMailer.workshop_proposed_with_reservation(workshop).deliver_now
  end

  def accepted_by_venue(workshop)
    #puts "accepted_by_venue #{workshop}"
    VenueMailer.accepted_by_venue(workshop).deliver_now
  end

  def workshop_has_been_given(workshop)
    #puts "workshop_has_been_given #{workshop}"
    VenueMailer.workshop_has_been_given(workshop).deliver_now
  end

  def workshop_cancelled_by_expert(workshop)
    #puts "workshop_cancelled_by_expert #{workshop}"
    VenueMailer.workshop_cancelled_by_expert(workshop).deliver_now
  end

  def workshop_revoked_by_venue(workshop)
    #puts "workshop_revoked_by_venue #{workshop}"
    VenueMailer.workshop_revoked_by_venue(workshop).deliver_now
  end

  def workshop_posposed_by_expert(workshop)
    #puts "workshop_posposed_by_expert #{workshop}"
    VenueMailer.workshop_posposed_by_expert(workshop).deliver_now
  end

  def reservation_updated(venue,former_workshop)
    VenueMailer.reservation_updated(venue,former_workshop).deliver_now
  end

end
