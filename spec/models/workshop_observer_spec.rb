require 'rails_helper'

RSpec.describe WorkshopObserver, :type => :observer do

  let(:observer){
    WorkshopObserver.instance
  }

  describe "invoke notifiers" do
    let(:workshop){
      FactoryGirl.create(:workshop)
    }

    let(:notifiers){
      [StudentNotifier.new, ExpertNotifier.new, VenueNotifier.new]
    }

    it "notify" do
      observer.send(:notify,notifiers,:workshop_has_been_given ,workshop)
    end
  end

  describe "state machine" do
    
    
    it "proposed by expert" do
      workshop=FactoryGirl.build(:workshop)
      workshop.proposed_by_expert
      expect(workshop.proposed?).to be_truthy
      expect(workshop.last_event).to eql(:proposed_by_expert)
      observer.after_commit(workshop)
    end

  end

end
