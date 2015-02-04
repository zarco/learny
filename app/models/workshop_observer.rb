class WorkshopObserver < ActiveRecord::Observer


  def initialize
    @student_notifier=StudentNotifier.new
    @expert_notifier=ExpertNotifier.new
    @venue_notifier=VenueNotifier.new
    @staff_notifier=StaffNotifier.new
    super
  end

  #def after_create(workspace)
    #puts "after_create #{workspace.name}"
  #end
    
  def after_commit(workshop)
    puts "after_commit last_event: #{workshop.last_event}"
    
    #begin
      case workshop.last_event
      when :proposed_by_expert
        #puts "notifying expert"
        #puts "notifying venue"
        notifiers=[@expert_notifier,@venue_notifier]
        notify(notifiers,:workshop_proposed_by_expert, workshop)
      when :proposed_with_reservation
        #puts "notifying expert"
        #puts "notifying venue"      
        notifiers=[@expert_notifier,@venue_notifier]
        notify(notifiers,:workshop_proposed_with_reservation, workshop)
      when :accepted_by_venue
        #puts "notifying expert"
        notifiers=[@expert_notifier]
        notify(notifiers,:workshop_accepted_by_venue, workshop)
      when :cancelled_by_expert
        #puts "notifying venue"
        #@student_notifier.workshop_cancelled_by_expert(workshop)
        #puts "notifying staff"
        notifiers=[@student_notifier,@venue_notifier,@staff_notifier]
        notify(notifiers,:workshop_cancelled_by_expert, workshop)
      when :has_been_given
        #@student_notifier.workshop_has_been_given(workshop)
        #puts "notifying experts. Assesment"
        #puts "notifying venue. Assesment"
        notifiers=[@student_notifier,@expert_notifier,@venue_notifier]
        notify(notifiers,:workshop_has_been_given, workshop)
      when :revoked_by_venue
        #@student_notifier.workshop_revoked_by_venue(workshop)
        #puts "notifying expert"
        #puts "notifying staff"
        notifiers=[@student_notifier,@expert_notifier,@staff_notifier]
        notify(notifiers,:workshop_revoked_by_venue, workshop)
      when :rejected_by_venue
        #puts "notifying expert"
        notifiers=[@expert_notifier]
        notify(notifiers,:workshop_rejected_by_venue, workshop)
      when :posposed_by_expert
        #puts "notifying venue"
        #@student_notifier.workshop_posposed_by_expert(workshop)
        #puts "notifying staff"
        notifiers=[@student_notifier,@venue_notifier,@staff_notifier]
        notify(notifiers,:workshop_revoked_by_venue, workshop)
      end
    #rescue Exception => e
    #  puts "Is fucked #{e}"
    #end  
    workshop.last_event=nil
  end
  
  protected
  def notify( notifiers,method, *args)
    #puts "#{notifiers}"
    notifiers.each do |notifier|
      notifier.send(method,args)
    end
  end  

end

