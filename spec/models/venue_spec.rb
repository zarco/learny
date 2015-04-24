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
    it { should respond_to :facebook_link }
    it { should respond_to :twitter_link }
    it { should respond_to :google_plus_link }
    it { should respond_to :website }
    it { should respond_to :deleted_at }
  end

  describe 'associations' do
    subject {FactoryGirl.build(:venue)}
    it { should have_many(:calendars)}
    it { should belong_to(:zone)}    
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

  describe 'reservations' do
    it 'retreive' do
      expert=FactoryGirl.create(:expert)
      workshop=FactoryGirl.create(:workshop, :expert => expert)
      venue=FactoryGirl.create(:venue)
      reservation=FactoryGirl.create(:reservation, :calendar => venue.calendars.first, :workshop => workshop,:starts_at => Date.new(2511,11,11))
      
      reservations=venue.reservations
      expect(reservations.to_a).to eq([reservation])
    end
  end

  describe 'soft delete' do
    let(:venue){
      FactoryGirl.create(:no_calendar_venue)
    }

    it "deleted" do
      expect(venue.deleted?).to be_falsey
      expect(Venue.all.to_a).to eql([venue])
      venue.destroy
      expect(venue.deleted?).to be_truthy
      expect(Venue.all.to_a).to eql([])
      expect(Venue.with_deleted.to_a).to eql([venue])
    end

    it "really deleted" do
      expect(venue.deleted?).to be_falsey
      expect(Venue.all.to_a).to eql([venue])
      venue.really_destroy!
      expect(venue.deleted?).to be_truthy
      expect(Venue.all.to_a).to eql([])
      expect(Venue.with_deleted.to_a).to eql([])
    end
  end

end

