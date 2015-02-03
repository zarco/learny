class WorkshopObserver < ActiveRecord::Observer


  def initialize
    @student_notifier=StudentNotifier.new
    super
  end

  #def after_create(workspace)
    #puts "after_create #{workspace.name}"
  #end
    
  def after_commit(workshop)
    puts "after_commit last_event: #{workspace.last_event}"
    
    case workshop.last_event
    when :proposed_by_expert
      puts "notifying expert"
      puts "notifying venue"
    when :proposed_with_reservation
      puts "notifying expert"
      puts "notifying venue"      
    when :accepted_by_venue
      puts "notifying expert"
    when :cancelled_by_expert
      puts "notifying venue"
      @student_notifier.workshop_cancelled_by_expert(workshop)
      puts "notifying staff"
    when :has_been_given
      @student_notifier.workshop_has_been_given(workshop)
      puts "notifying experts. Assesment"
      puts "notifying venue. Assesment"
    when :revoked_by_venue
      @student_notifier.workshop_revoked_by_venue(workshop)
      puts "notifying expert"
      puts "notifying staff"
    when :rejected_by_venue
      puts "notifying expert"
    when :posposed_by_expert
      puts "notifying venue"
      @student_notifier.workshop_posposed_by_expert(workshop)
      puts "notifying staff"
      
    end
    
    workspace.last_event=nil
      
  end

end

