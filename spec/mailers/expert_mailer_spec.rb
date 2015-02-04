require "rails_helper"

RSpec.describe ExpertMailer, :type => :mailer do
  describe "workshop_proposed_by_expert" do
    let(:mail) { ExpertMailer.workshop_proposed_by_expert }

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
    let(:mail) { ExpertMailer.workshop_proposed_with_reservation }

    it "renders the headers" do
      expect(mail.subject).to eq("Workshop proposed with reservation")
      expect(mail.to).to eq(["to@example.org"])
      expect(mail.from).to eq(["from@example.com"])
    end

    it "renders the body" do
      expect(mail.body.encoded).to match("Hi")
    end
  end

  describe "accepted_by_venue" do
    let(:mail) { ExpertMailer.accepted_by_venue }

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
    let(:mail) { ExpertMailer.workshop_has_been_given }

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
    let(:mail) { ExpertMailer.workshop_cancelled_by_expert }

    it "renders the headers" do
      expect(mail.subject).to eq("Workshop cancelled by expert")
      expect(mail.to).to eq(["to@example.org"])
      expect(mail.from).to eq(["from@example.com"])
    end

    it "renders the body" do
      expect(mail.body.encoded).to match("Hi")
    end
  end

  describe "workshop_revoked_by_venue" do
    let(:mail) { ExpertMailer.workshop_revoked_by_venue }

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
    let(:mail) { ExpertMailer.workshop_posposed_by_expert }

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
