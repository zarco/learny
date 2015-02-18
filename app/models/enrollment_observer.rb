class EnrollmentObserver < ActiveRecord::Observer
  
  def initialize
    @student_notifier=StudentNotifier.new
    @expert_notifier=ExpertNotifier.new
    super
  end
  
  def after_destroy(enrollment)
  end
  
  def after_create(enrollment)
  end
  
  
  
  def after_commit(enrollment)
    if enrollment.persisted?
      @student_notifier.enrollment_created(enrollment)
      @expert_notifier.enrollment_created(enrollment)
      
    elsif enrollment.destroyed?
      @student_notifier.enrollment_destroyed(enrollment)
      @expert_notifier.enrollment_destroyed(enrollment)
    end
  end
  
end
