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
    it { should respond_to :cover }
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
    it { should allow_value(1).for(:max_participants) }
    it { should allow_value(10).for(:max_participants) }
    it { should allow_value(999999).for(:max_participants) }
    it { should_not allow_value(0).for(:max_participants) }
    it { should_not allow_value(-1).for(:max_participants) }
    it { should_not allow_value(1.1).for(:max_participants) }
    it { should_not allow_value(0.00001).for(:max_participants) }
    it { should allow_value(0).for(:cover) }
    it { should allow_value(1.1).for(:cover) }
    it { should allow_value(0.00001).for(:cover) }
    it { should_not allow_value(-1).for(:cover) }
    it { should_not allow_value('a').for(:cover) }

  end
  
  describe 'validate workshop' do
    before(:each) do
       @reservation=FactoryGirl.create(:reservation, :max_participants => 25)
    end
    
    it 'valid workshop' do
      workshop=FactoryGirl.create(:workshop)
      expect(@reservation.valid?).to be_truthy
    end
    
    it 'invalid participants number' do
      workshop=FactoryGirl.create(:workshop, :max_number_participants => 100) 
      @reservation.workshop=workshop
      expect(@reservation.valid?).to be_falsey
      #expect(@reservation.errors).to eq.error_on(:workshop)
    end
    
    it 'invalid duration' do
      workshop=FactoryGirl.create(:workshop, :length=> 10)
      @reservation.workshop=workshop
      #puts ">>>>>>>>>>>>> #{@reservation.availability_in_hours}"
      expect(@reservation.valid?).to be_falsey
      #expect(@reservation.errors).to eq(1).error_on(:workshop)
    end
  end

  describe 'invalid final time' do
    it 'one hour' do
      reservation=FactoryGirl.build(:reservation, :starts_at => Time.now+1.hour , :final_time => Time.now-1)
      expect(reservation.valid?).to be_falsey
    end
  end
  
  describe 'validate start in the past' do
    it 'one day' do
      reservation=FactoryGirl.build(:reservation, :starts_at => Time.now-1.day)
      expect(reservation.valid?).to be_falsey
    end
    
    it 'one hour' do
      reservation=FactoryGirl.build(:reservation, :starts_at => Time.now-1.hour)
      expect(reservation.valid?).to be_falsey
    end

  end
  
  describe 'availability in hours' do
    it 'difference' do
      reservation=FactoryGirl.build(:reservation, :starts_at => Time.new(2014,01,01,10,00), :final_time => Time.new(2014,01,01,13,30))
      expect(reservation.availability_in_hours).to eql(3.5)
    end
    
    it 'other difference' do
      reservation=FactoryGirl.build(:reservation, :starts_at => Time.new(2014,01,01,10,00), :final_time => Time.new(2018,10,31,13,30))
      reservation.valid?
      expect(reservation.availability_in_hours).to eql(3.5)
    end
    
  end

  describe 'methods' do
    it 'formatted date' do
      enrollment=FactoryGirl.build(:reservation, :starts_at => DateTime.new(2007,11,19,8,37,48,"-06:00"))
      expect(enrollment.fmt_starts_at).to eq('19-November-2007, 08:37')
    end
  end
end
