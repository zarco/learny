require 'spec_helper'

describe Expert do
  describe 'factories' do
    it 'has a valid factory' do
      expect(FactoryGirl.build(:expert)).to be_valid
    end
    it 'has an invalid factory' do
      expect(FactoryGirl.build(:invalid_expert)).to_not be_valid
    end
  end
  describe 'attributes' do
    subject { FactoryGirl.build(:expert) }
    it { should respond_to :first_name }
    it { should respond_to :last_name }
    it { should respond_to :occupation }
    it { should respond_to :profile }
    it { should respond_to :facebook_link }
    it { should respond_to :twitter_link }
    it { should respond_to :linkedin_link }
    #it { should respond_to :website }
    it { should respond_to :avatar }
    
  end
  
  describe 'associations' do
    subject {FactoryGirl.build(:expert)}
    it { should have_many(:workshops)}
  end
  
  describe 'methods' do
    it 'last name' do
      full_name=FactoryGirl.build(:expert, :first_name => 'Juan', :last_name => 'Perez').full_name
      expect(full_name).to eq("Juan Perez")
    end
    
    it 'next workshops' do
      expert=FactoryGirl.create(:expert)
      workshop=FactoryGirl.create(:workshop, :expert => expert)
      venue=FactoryGirl.create(:venue)
      reservation=FactoryGirl.create(:reservation, :calendar => venue.calendars.first, :workshop => workshop,
        :starts_at => Date.new(2511,11,11))
      
      next_workshops=expert.next_workshops
      #puts next_workshops
      expect(next_workshops.count).to eq(1)
    end
    
    it 'next workshops' do
      expert=FactoryGirl.create(:expert)
      workshop=FactoryGirl.create(:workshop, :expert => expert)
      venue=FactoryGirl.create(:venue)
      reservation=FactoryGirl.create(:reservation, :calendar => venue.calendars.first,
         :workshop => workshop, :starts_at => Date.new(2011,11,11))
      prev_workshops=expert.previous_workshops
      
      #puts prev_workshops
      expect(prev_workshops.count).to eq(1)
    end
  end

end