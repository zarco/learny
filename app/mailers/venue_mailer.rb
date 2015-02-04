class VenueMailer < ActionMailer::Base
  default from: "from@example.com"

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.venue_mailer.workshop_proposed_by_expert.subject
  #
  def workshop_proposed_by_expert(workshop)
    @greeting = "Hi"

    mail to: "to@example.org"
  end

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.venue_mailer.workshop_proposed_with_reservation.subject
  #
  def workshop_proposed_with_reservation(workshop)
    @greeting = "Hi"

    mail to: "to@example.org"
  end

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.venue_mailer.accepted_by_venue.subject
  #
  def accepted_by_venue(workshop)
    @greeting = "Hi"

    mail to: "to@example.org"
  end

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.venue_mailer.workshop_has_been_given.subject
  #
  def workshop_has_been_given(workshop)
    @greeting = "Hi"

    mail to: "to@example.org"
  end

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.venue_mailer.workshop_cancelled_by_expert.subject
  #
  def workshop_cancelled_by_expert(workshop)
    @greeting = "Hi"

    mail to: "to@example.org"
  end

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.venue_mailer.workshop_revoked_by_venue.subject
  #
  def workshop_revoked_by_venue(workshop)
    @greeting = "Hi"

    mail to: "to@example.org"
  end

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.venue_mailer.workshop_posposed_by_expert.subject
  #
  def workshop_posposed_by_expert(workshop)
    @greeting = "Hi"

    mail to: "to@example.org"
  end

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.venue_mailer.reservation_updated.subject
  #
  def reservation_updated(venue,former_workshop)
    @venue=venue
    @workshop=former_workshop
    mail to: venue.email
  end
end
