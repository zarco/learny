require 'spec_helper'

RSpec.describe Calendar, :type => :model do
  describe 'factories' do
    it 'has a valid factory' do
      expect(FactoryGirl.build(:calendar)).to be_valid
    end
    it 'has an invalid factory' do
      expect(FactoryGirl.build(:invalid_calendar)).to_not be_valid
    end

    it 'has an default factory' do
      calendar=FactoryGirl.build(:default_calendar)
      expect(calendar).to be_valid
      expect(calendar.is_default).to be_truthy
    end
  end
  describe 'attributes' do
    subject { FactoryGirl.build(:calendar) }
    it { should respond_to :title }
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
end