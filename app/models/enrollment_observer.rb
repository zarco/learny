class EnrollmentObserver < ActiveRecord::Observer
  
  def initialize
    @student_notifier=StudentNotifier.new
    #@expert_notifier=ExpertNotifier.new
    #@venue_notifier=VenueNotifier.new
    #@staff_notifier=StaffNotifier.new
  end
  
  
  def before_create(enrollment)
    puts "enrollment before create"
  end
  
  def after_create(enrollment)
    puts "fuck >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> "
    #@student_notifier.enrollment_created(enrollment)
  end
  
  def after_destroy(enrollment)
    puts ">>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> "
    #@student_notifier.enrollment_destroyed(enrollment)
  end
  
  def after_commit(enrollment)
    puts "Dai modafoca dai"
  end
  
end
