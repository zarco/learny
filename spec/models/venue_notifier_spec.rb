require 'rails_helper'

RSpec.describe VenueNotifier , :type => :model do

  let(:notifier){
    VenueNotifier.new
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
    
    it "cancelled by expert" do
      notifier.workshop_cancelled_by_expert(workshop)
    end
    
    it "accepted by venue" do
      notifier.accepted_by_venue(workshop)
    end

    it "has been given" do
      notifier.workshop_has_been_given(workshop)
    end

    it "posposed by expert" do
      notifier.workshop_posposed_by_expert(workshop)
    end
  end

end
