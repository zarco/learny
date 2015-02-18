require 'rails_helper'

RSpec.describe StaffNotifier , :type => :model do

  let(:notifier){
    StaffNotifier.new
  }

  describe "Workshop states" do
    let(:workshop){
      FactoryGirl.create(:workshop)
    }

    it "cancelled by expert" do
      notifier.workshop_cancelled_by_expert(workshop)
    end
    
    it "posposed by expert" do
      notifier.workshop_posposed_by_expert(workshop)
    end
    
    it "revoked by venue" do
      notifier.workshop_revoked_by_venue(workshop)
    end
  end

end
