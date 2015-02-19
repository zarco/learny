require 'rails_helper'

RSpec.describe ExpertNotifier , :type => :model do

  let(:notifier){
    ExpertNotifier.new
  }

  describe "Workshop states" do
    let(:workshop){
      FactoryGirl.create(:workshop)
    }

    it "proposed by expert" do
      notifier.workshop_proposed_by_expert(workshop)
    end
    
    it "proposed with reservation" do
      notifier.workshop_proposed_with_reservation(workshop)
    end
    
    it "accepted by venue" do
      notifier.accepted_by_venue(workshop)
    end

    it "has been given" do
      notifier.workshop_has_been_given(workshop)
    end

    it "revoked by venue" do
      notifier.workshop_revoked_by_venue(workshop)
    end

    it "rejected by venue" do
      notifier.workshop_posposed_by_expert(workshop)
    end
  end

end
