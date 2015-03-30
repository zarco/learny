require "rails_helper"

RSpec.describe VenueMailer, :type => :mailer do
  
  let(:workshop){
    FactoryGirl.create(:workshop_with_reservation)
  }
  
  describe "workshop_proposed_by_expert" do
    let(:mail) { VenueMailer.workshop_proposed_by_expert(workshop)}

    it "renders the headers" do
      expect(mail.subject).to eq("Workshop proposed by expert")
      expect(mail.to).to eq(["to@example.org"])
      expect(mail.from).to eq(["from@example.com"])
    end

    it "renders the body" do
      expect(mail.body.encoded).to match("Hi")
    end
  end

  describe "workshop_proposed_with_reservation" do
    let(:mail) { VenueMailer.workshop_proposed_with_reservation(workshop) }

    it "renders the headers" do
      expect(mail.subject).to eq("Se ha confirmado un taller en tu Establecimiento")
      expect(mail.to).to eq([workshop.venue.email])
      expect(mail.from).to eq(["from@example.com"])
    end

    it "renders the body" do
      expect(mail.body.encoded).to match("Learny | Hay un nuevo Taller Confirmado en tu Establecimiento")
    end
  end

  describe "accepted_by_venue" do
    let(:mail) { VenueMailer.accepted_by_venue(workshop) }

    it "renders the headers" do
      expect(mail.subject).to eq("Accepted by venue")
      expect(mail.to).to eq(["to@example.org"])
      expect(mail.from).to eq(["from@example.com"])
    end

    it "renders the body" do
      expect(mail.body.encoded).to match("Hi")
    end
  end

  describe "workshop_has_been_given" do
    let(:mail) { VenueMailer.workshop_has_been_given(workshop) }

    it "renders the headers" do
      expect(mail.subject).to eq("Workshop has been given")
      expect(mail.to).to eq(["to@example.org"])
      expect(mail.from).to eq(["from@example.com"])
    end

    it "renders the body" do
      expect(mail.body.encoded).to match("Hi")
    end
  end

  describe "workshop_cancelled_by_expert" do
    let(:mail) { VenueMailer.workshop_cancelled_by_expert(workshop) }

    it "renders the headers" do
      expect(mail.subject).to eq("Se ha cancelado una reservación")
      expect(mail.to).to eq(["to@example.org"])
      expect(mail.from).to eq(["from@example.com"])
    end

    it "renders the body" do
      expect(mail.body.encoded).to match("Hi")
    end
  end

  describe "workshop_revoked_by_venue" do
    let(:mail) { VenueMailer.workshop_revoked_by_venue(workshop) }

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
    let(:mail) { VenueMailer.workshop_posposed_by_expert(workshop) }

    it "renders the headers" do
      expect(mail.subject).to eq("Workshop posposed by expert")
      expect(mail.to).to eq(["to@example.org"])
      expect(mail.from).to eq(["from@example.com"])
    end

    it "renders the body" do
      expect(mail.body.encoded).to match("Hi")
    end
  end

end
