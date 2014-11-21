require 'spec_helper'

RSpec.describe Reservation, :type => :model do
  describe 'factories' do
    it 'has a valid factory' do
      expect(FactoryGirl.build(:reservation)).to be_valid
    end
    it 'has an invalid factory' do
      expect(FactoryGirl.build(:invalid_reservation)).to_not be_valid
    end
  end
  describe 'attributes' do
    subject { FactoryGirl.build(:reservation) }
    it { should respond_to :starts_at }
    it { should respond_to :final_time }
    it { should respond_to :max_participants }
    it { should respond_to :all_day }
  end
  
  describe 'associations' do
    subject {FactoryGirl.build(:reservation)}
    it { should belong_to(:calendar)}
    it { should belong_to(:workshop)}
  end
end
