require 'spec_helper'

describe Student do
  describe 'factories' do
    it 'has a valid factory' do
      expect(FactoryGirl.build(:student)).to be_valid
    end
    it 'has an invalid factory' do
      expect(FactoryGirl.build(:invalid_student)).to_not be_valid
    end
  end
  describe 'attributes' do
    subject { FactoryGirl.build(:student) }
    it { should respond_to :first_name }
    it { should respond_to :last_name }
    it { should respond_to :occupation }
    it { should respond_to :profile }
    it { should respond_to :avatar }
  end

  describe 'find workshops where student is enrolled' do
    it 'next workshops' do
      student=FactoryGirl.create(:student)
      expert=FactoryGirl.create(:expert)
      venue=FactoryGirl.create(:venue)

      workshop=FactoryGirl.create(:workshop, :expert => expert)
      reservation=FactoryGirl.create(:reservation, :calendar => venue.calendars.first, :workshop => workshop,
        :starts_at => Date.new(2511,11,11))
      enrollment=FactoryGirl.create(:enrollment, :workshop => workshop, :student => student)
      
      next_workshops=student.next_workshops
      expect(next_workshops.count).to eq(1)
    end
    
    it 'previous workshops' do
      expert=FactoryGirl.create(:expert)
      workshop=FactoryGirl.create(:workshop, :expert => expert)
      venue=FactoryGirl.create(:venue)
      reservation=FactoryGirl.build(:reservation, :calendar => venue.calendars.first,
         :workshop => workshop, :starts_at => Date.new(2011,11,11))
      reservation.save(:validate => false)
      student=FactoryGirl.create(:student)
      enrollment=FactoryGirl.create(:enrollment, :workshop => workshop, :student => student)
      prev_workshops=student.previous_workshops
      
      #puts prev_workshops
      expect(prev_workshops.count).to eq(1)
    end
  end
end
