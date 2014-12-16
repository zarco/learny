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

  describe 'validations' do
    subject { FactoryGirl.build(:reservation) }
    it { should validate_presence_of :starts_at }
    it { should validate_presence_of :final_time }
  end

  describe 'methods' do
    it 'formatted date' do
      enrollment=FactoryGirl.build(:reservation, :starts_at => DateTime.new(2007,11,19,8,37,48,"-06:00"))
      expect(enrollment.fmt_starts_at).to eq('19-November-2007, 08:37')
    end
  end
end