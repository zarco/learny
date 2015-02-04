require "rails_helper"

RSpec.describe StudentMailer, :type => :mailer do
  describe "enrolled_in_a_workshop" do
    let(:mail) { StudentMailer.enrolled_in_a_workshop }

    it "renders the headers" do
      expect(mail.subject).to eq("Enrolled in a workshop")
      expect(mail.to).to eq(["to@example.org"])
      expect(mail.from).to eq(["from@example.com"])
    end

    it "renders the body" do
      expect(mail.body.encoded).to match("Hi")
    end
  end

  describe "unenrolled_in_a_workshop" do
    let(:mail) { StudentMailer.unenrolled_in_a_workshop }

    it "renders the headers" do
      expect(mail.subject).to eq("Unenrolled in a workshop")
      expect(mail.to).to eq(["to@example.org"])
      expect(mail.from).to eq(["from@example.com"])
    end

    it "renders the body" do
      expect(mail.body.encoded).to match("Hi")
    end
  end

end
