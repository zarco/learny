require "rails_helper"

RSpec.describe ExpertMailer, :type => :mailer do

  let(:workshop){ FactoryGirl.create(:workshop) }   

  describe "workshop_proposed_by_expert" do    
    let(:mail) { ExpertMailer.workshop_proposed_by_expert(workshop) }

    it "renders the headers" do
      expect(mail.subject).to eq("Has propuesto un nuevo taller")
      expect(mail.to).to eq([workshop.expert.email])
      expect(mail.from).to eq(["from@example.com"])
    end

    it "renders the body" do
      expect(mail.body.encoded).to match("Learny | Nuevo Taller Propuesto")
    end
  end

  describe "workshop_proposed_with_reservation" do
    pending ('Factory de Workshop no crea un Venue')
    #let(:mail) { ExpertMailer.workshop_proposed_with_reservation(workshop) }

    #it "renders the headers" do
      #expect(mail.subject).to eq("Workshop proposed with reservation")
      #expect(mail.to).to eq(["to@example.org"])
      #expect(mail.from).to eq(["from@example.com"])
    #end

    #it "renders the body" do
      #expect(mail.body.encoded).to match("Hi")
    #end    
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
    let(:mail) { ExpertMailer.workshop_cancelled_by_expert(workshop) }

    it "renders the headers" do
      expect(mail.subject).to eq("Has cancelado un taller")
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

  context "A student enrolle in a workshop" do
    
    let(:enrollment){
      FactoryGirl.create(:enrollment)
    }
        
    describe "enrollment_created" do
      let(:mail) { ExpertMailer.enrollment_created enrollment }

      it "renders the headers" do       
        expect(mail.subject).to eq("Enrollment created")
        expect(mail.to).to eq([enrollment.workshop.expert.email])
        expect(mail.from).to eq(["from@example.com"])
      end

      it "renders the body" do
        expect(mail.body.encoded).to match("Hi")
      end
    end

    describe "enrollment_destroyed" do
      let(:mail) { ExpertMailer.enrollment_destroyed enrollment}

      it "renders the headers" do
        expect(mail.subject).to eq("Enrollment destroyed")
        expect(mail.to).to eq([enrollment.workshop.expert.email])
        expect(mail.from).to eq(["from@example.com"])
      end

      it "renders the body" do
        expect(mail.body.encoded).to match("Hi")
      end
    end
  end

end
