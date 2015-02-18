require 'spec_helper'

describe Venue do
  describe 'factories' do
    it 'has a valid factory' do
      expect(FactoryGirl.build(:venue)).to be_valid
    end
    it 'has an invalid factory' do
      expect(FactoryGirl.build(:invalid_venue)).to_not be_valid
    end
  end
  describe 'attributes' do
    subject { FactoryGirl.build(:venue) }
    it { should respond_to :name }
  end

  describe 'associations' do
    subject {FactoryGirl.build(:venue)}
    it { should have_many(:calendars)}
  end
  
  describe 'validations' do
    subject { FactoryGirl.build(:venue) }
    it { should validate_presence_of :name }
  end

  describe 'methods' do
    it 'next workshops' do
      expert=FactoryGirl.create(:expert)
      workshop=FactoryGirl.create(:workshop, :expert => expert)
      venue=FactoryGirl.create(:venue)
      reservation=FactoryGirl.create(:reservation, :calendar => venue.calendars.first, :workshop => workshop,
        :starts_at => Date.new(2511,11,11))
      
      next_workshops=venue.next_workshops
      expect(next_workshops.count).to eq(1)
    end
  end

end

