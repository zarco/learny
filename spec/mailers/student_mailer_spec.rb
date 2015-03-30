require "rails_helper"

RSpec.describe StudentMailer, :type => :mailer do
  describe "workshop_cancelled_by_expert" do
    let(:mail) { StudentMailer.workshop_cancelled_by_expert }

    it "renders the headers" do
      expect(mail.subject).to eq("Workshop cancelled by expert")
      expect(mail.to).to eq(["to@example.org"])
      expect(mail.from).to eq(["from@example.com"])
    end

    it "renders the body" do
      expect(mail.body.encoded).to match("Hi")
    end
  end

  describe "workshop_has_been_given" do
    let(:mail) { StudentMailer.workshop_has_been_given }

    it "renders the headers" do
      expect(mail.subject).to eq("Workshop has been given")
      expect(mail.to).to eq(["to@example.org"])
      expect(mail.from).to eq(["from@example.com"])
    end

    it "renders the body" do
      expect(mail.body.encoded).to match("Hi")
    end
  end

  describe "workshop_revoked_by_venue" do
    let(:mail) { StudentMailer.workshop_revoked_by_venue }

    it "renders the headers" do
      expect(mail.subject).to eq("Workshop revoked by venue")
      expect(mail.to).to eq(["to@example.org"])
      expect(mail.from).to eq(["from@example.com"])
    end

    it "renders the body" do
      expect(mail.body.encoded).to match("Hi")
    end
  end

  describe "workshop_posposed_by_expert" do
    let(:mail) { StudentMailer.workshop_posposed_by_expert }

    it "renders the headers" do
      expect(mail.subject).to eq("Workshop posposed by expert")
      expect(mail.to).to eq(["to@example.org"])
      expect(mail.from).to eq(["from@example.com"])
    end

    it "renders the body" do
      expect(mail.body.encoded).to match("Hi")
    end
  end

  context "Enrollment to a workshop" do
    let(:enrollment){
      FactoryGirl.create(:enrollment)
    }
    describe "enrollment_created" do
      let(:mail) { StudentMailer.enrollment_created(enrollment) }

      it "renders the headers" do
        expect(mail.subject).to eq("Te has inscrito a un taller en Learny")
        expect(mail.to).to eq([enrollment.student.email])
        expect(mail.from).to eq(["from@example.com"])
      end

      it "renders the body" do
        expect(mail.body.encoded).to match("Learny | Inscripción al taller")
      end
    end

    describe "enrollment_destroyed" do
      let(:mail) { StudentMailer.enrollment_destroyed(enrollment) }

      it "renders the headers" do
        expect(mail.subject).to eq("Enrollment destroyed")
        expect(mail.to).to eq([enrollment.student.email])
        expect(mail.from).to eq(["from@example.com"])
      end

      it "renders the body" do
        expect(mail.body.encoded).to match("Hi")
      end
    end
  end

end
