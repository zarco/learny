class ExpertMailer < ActionMailer::Base
  default from: "from@example.com"

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.expert_mailer.workshop_proposed_by_expert.subject
  #
  def workshop_proposed_by_expert(workshop)
    @workshop = workshop

    mail(to: workshop.expert.email) do |format|
      format.html
      format.text
    end
  end

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.expert_mailer.workshop_proposed_with_reservation.subject
  #
  def workshop_proposed_with_reservation(workshop)    
    @workshop = workshop
    @venue = workshop.venue
    @reservation = workshop.reservation
    mail to: workshop.expert.email
  end

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.expert_mailer.accepted_by_venue.subject
  #
  def workshop_accepted_by_venue(workshop)
    @workshop = workshop
    @reservation = workshop.reservation
    @venue = @reservation.venue
    puts "#{@workshop}"
    puts "#{@reservation}"
    puts "#{@venue}"
    
    mail to: workshop.expert.email
  end

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.expert_mailer.workshop_has_been_given.subject
  #
  def workshop_has_been_given
    @greeting = "Hi"

    mail to: "to@example.org"
  end

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.expert_mailer.workshop_cancelled_by_expert.subject
  #
  def workshop_cancelled_by_expert(workshop)
    @greeting = "Hi"

    mail to: "to@example.org"
  end

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.expert_mailer.workshop_revoked_by_venue.subject
  #
  def workshop_revoked_by_venue
    @greeting = "Hi"

    mail to: "to@example.org"
  end

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.expert_mailer.workshop_posposed_by_expert.subject
  #
  def workshop_posposed_by_expert
    @greeting = "Hi"
    mail to: "to@example.org"
  end

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.expert_mailer.enrollment_created.subject
  #
  def enrollment_created(enrollment)
    @workshop = enrollment.workshop
    @venue = enrollment.workshop.venue
    @student = enrollment.student
    mail to: enrollment.workshop.expert.email
  end

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.expert_mailer.enrollment_destroyed.subject
  #
  def enrollment_destroyed(enrollment)
    @greeting = "Hi"
    mail to: enrollment.workshop.expert.email
  end
end
