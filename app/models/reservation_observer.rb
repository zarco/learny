class ReservationObserver < ActiveRecord::Observer

  def initialize
    @student_notifier=StudentNotifier.new
    @venue_notifier=VenueNotifier.new
    super
  end

  def after_commit(reservation)
    if reservation.previous_changes.include?(:workshop_id)
      
      
      former_workshop_id=reservation.previous_changes[:workshop_id].first
      #puts "former workshop_id #{former_workshop_id}"
      if former_workshop_id
        former_workshop=Workshop.where(id: former_workshop_id).limit(1).first
        #puts "notifying #{reservation.venue} cancellation #{former_workshop}"
        #puts "notifying students #{former_workshop.students}"
        @venue_notifier.reservation_updated(reservation.venue,former_workshop)
        @student_notifier.reservation_updated(former_workshop)
      end
      
      
      current_workshop_id=reservation.previous_changes[:workshop_id].last
      #puts "current workshop #{current_workshop_id}"
      if current_workshop_id
        current_workshop=reservation.workshop#Workshop.find(current_workshop_id)
        #puts "current workshop last event#{current_workshop.last_event}"
        @venue_notifier.workshop_proposed_with_reservation(current_workshop)
      end
      
      
    end

  end

end
