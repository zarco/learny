require 'spec_helper'

RSpec.describe Calendar, :type => :model do
  describe 'factories' do
    it 'has a valid factory' do
      expect(FactoryGirl.build(:calendar)).to be_valid
    end
    it 'has an invalid factory' do
      expect(FactoryGirl.build(:invalid_calendar)).to_not be_valid
    end

    it 'has a default factory' do
      calendar=FactoryGirl.build(:default_calendar)
      expect(calendar).to be_valid
      expect(calendar.is_default).to be_truthy
    end
  end
  describe 'attributes' do
    subject { FactoryGirl.build(:calendar) }
    it { should respond_to :title }
    it { should respond_to :deleted_at }
  end
  describe 'associations' do
    subject {FactoryGirl.build(:calendar)}
    it { should belong_to(:venue) }
    it { should have_many(:reservations) }
  end

  describe 'validations' do
    subject { FactoryGirl.build(:default_calendar) }
    it { should validate_presence_of :title }
  end

  context 'soft delete' do
    describe 'only calendar' do
      let(:calendar){
        FactoryGirl.create(:default_calendar)
      }
      
      it "deleted" do
        expect(calendar).to respond_to(:deleted_at)
        expect(Calendar.all.to_a).to eql([calendar])
        calendar.destroy
        expect(Calendar.all.to_a).to eql([])
        expect(Calendar.with_deleted.to_a).to eql([calendar])
      end
      
      it "really deleted" do
        expect(calendar).to respond_to(:deleted_at)
        expect(Calendar.all.to_a).to eql([calendar])
        calendar.really_destroy!
        expect(Calendar.all.to_a).to eql([])
        expect(Calendar.with_deleted.to_a).to eql([])
      end
      
    end

    describe "for reservations" do
      let(:venue){
        FactoryGirl.create(:venue)
      }
      
      let(:calendar){
        FactoryGirl.create(:default_calendar, venue: venue)
      }
      
      let(:other_calendar){
        FactoryGirl.create(:calendar, venue: venue)
      }
      
      it "deleted" do
        FactoryGirl.create(:reservation, calendar: calendar)
        FactoryGirl.create(:reservation, calendar: calendar)
      
        FactoryGirl.create(:reservation, calendar: other_calendar)
        FactoryGirl.create(:reservation, calendar: other_calendar)
        
        expect(Reservation.all.count).to eql(4)
        other_calendar.destroy
        expect(Reservation.all.count).to eql(2)
        expect(Reservation.with_deleted.count).to eql(4)
        
      end
    end

  end

end
