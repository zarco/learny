require 'rails_helper'

RSpec.describe StudentNotifier , :type => :model do

  let(:notifier){
    StudentNotifier.new
  }

  describe "Workshop states" do
    let(:workshop){
      FactoryGirl.create(:workshop)
    }

    it "cancelled by expert" do
      notifier.workshop_cancelled_by_expert(workshop)
    end

    it "has been given" do
      notifier.workshop_has_been_given(workshop)
    end

    it "revoked by venue" do
      notifier.workshop_revoked_by_venue(workshop)
    end

    it "posposed by expert" do
      notifier.workshop_posposed_by_expert(workshop)
    end

  end

  describe "Enrollment " do
    let(:enrollment){
      FactoryGirl.create(:enrollment)
    }

    it "create" do
      notifier.enrollment_created(enrollment)
    end

    it "destroy" do
      notifier.enrollment_destroyed(enrollment)
    end
  end

  describe "Reservation " do
    let(:former_workshop){
      FactoryGirl.create(:workshop)
    }
    it "changed" do
      notifier.reservation_updated(former_workshop)
    end
  end

end
