class StudentMailer < ActionMailer::Base
  default from: "from@example.com"

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.student_mailer.enrolled_in_a_workshop.subject
  #
  def enrolled_in_a_workshop
    @greeting = "Hi"

    mail to: "to@example.org"
  end

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.student_mailer.unenrolled_in_a_workshop.subject
  #
  def unenrolled_in_a_workshop
    @greeting = "Hi"

    mail to: "to@example.org"
  end
end
