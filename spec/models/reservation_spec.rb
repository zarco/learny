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
    it { should respond_to(:venue)}
    it { should respond_to :cover }
    it { should respond_to :deleted_at }
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
    it { should allow_value(nil).for(:cover) }

    it 'workshop already reserved' do
      workshop=FactoryGirl.create(:workshop)
      expect(workshop.reservation).to be_nil
      reservation=FactoryGirl.create(:reservation, workshop: workshop)
      #puts "first reservation: #{reservation.valid?} #{reservation.errors.full_messages}"
      expect(reservation.valid?).to be_truthy
      other_reservation=FactoryGirl.build(:reservation, workshop: workshop)
      expect(other_reservation.valid?).to be_falsey
      #puts "second reservation: #{other_reservation.errors.full_messages}"
    end

    it 'workshop already reserved (save)' do
      workshop=FactoryGirl.build(:workshop)
      workshop.save
      expect(workshop.reservation).to be_nil
      reservation=FactoryGirl.create(:reservation, workshop: workshop)
      #puts "first reservation: #{reservation.valid?} #{reservation.errors.full_messages}"
      expect(reservation.valid?).to be_truthy
      other_reservation=FactoryGirl.build(:reservation, workshop: workshop)
      expect(other_reservation.valid?).to be_falsey
      #puts "second reservation: #{other_reservation.errors.full_messages}"      
    end


    describe 'date range' do
      let(:base_date){
        DateTime.now.change(hour: 12, min: 00)+1.day
      }
        
      
      let(:venue){
        FactoryGirl.create(:venue)
      }
      
      let(:calendar){
        venue.calendars.first
      }
      
      let(:workshop){
        FactoryGirl.create(:workshop)
      }
      before(:each){
        FactoryGirl.create(:reservation, calendar: calendar, 
          starts_at: base_date, final_time: base_date.change(hour: 15))
      }
      
      let(:other_workshop){
        FactoryGirl.create(:workshop)
      }
      let(:other_venue){
        FactoryGirl.create(:venue)
      }
      
      it 'valid start at' do
        other_reservation=FactoryGirl.build(:reservation, workshop: workshop, calendar: calendar, 
          starts_at: base_date.change(hour: 15), final_time: base_date.change(hour: 16))
        puts "#{other_reservation.starts_at} #{other_reservation.final_time}"
        other_reservation.valid?
        #puts ">>>>> #{other_reservation.errors.full_messages}"
        expect(other_reservation.valid?).to be_truthy
      end
        
      it 'valid final time' do
        other_reservation=FactoryGirl.build(:reservation, workshop: workshop, calendar: calendar, 
          starts_at: base_date.change(hour: 11), final_time: base_date.change(hour: 12))
        #other_reservation.valid?
        #puts "#{other_reservation.starts_at} #{other_reservation.final_time}"
        #puts ">>>>> #{other_reservation.errors.full_messages}"
        expect(other_reservation.valid?).to be_truthy
      end

      it 'invalid start time' do
        other_reservation=FactoryGirl.build(:reservation, workshop: workshop, calendar: calendar, 
          starts_at: base_date.change(hour: 13), final_time: base_date.change(hour: 16))
        #expect(other_reservation.valid?).to be_falsey
        puts ">>>>> #{other_reservation.errors.full_messages}"
      end
      
      it 'invalid final time' do
        other_reservation=FactoryGirl.build(:reservation, workshop: workshop, calendar: calendar, 
          starts_at: base_date.change(hour: 11), final_time: base_date.change(hour: 13))
        expect(other_reservation.valid?).to be_falsey
        #puts ">>>>> #{other_reservation.errors.full_messages}"
      end
      it 'invalid date range' do
        other_reservation=FactoryGirl.build(:reservation, workshop: workshop, calendar: venue.calendars.first, 
          starts_at: base_date.change(hour: 11), final_time: base_date.change(hour: 16))
        expect(other_reservation.valid?).to be_falsey
        #puts ">>>>> #{other_reservation.errors.full_messages}"
      end

    end

  end

  describe 'validate workshop' do
    before(:each) do
      @reservation=FactoryGirl.create(:reservation, :max_participants => 25)
    end

    it 'valid workshop' do
      workshop=FactoryGirl.create(:workshop)
      expect(@reservation.valid?).to be_truthy
    end

    it 'valid workshop same time' do
      workshop=FactoryGirl.create(:workshop, :length => 4)
      @reservation.workshop=workshop
      expect(@reservation.valid?).to be_truthy
      expect(@reservation.availability_in_hours).to eq(4)
    end

    it 'invalid participants number' do
      workshop=FactoryGirl.create(:workshop, :max_number_participants => 100)
      @reservation.workshop=workshop
      expect(@reservation.valid?).to be_falsey
    #expect(@reservation.errors).to eq.error_on(:workshop)
    end

    it 'invalid workshop almost same time' do
      workshop=FactoryGirl.create(:workshop, :length => 5)
      @reservation.workshop=workshop
      expect(@reservation.availability_in_hours).to eq(4)
      expect(@reservation.valid?).to be_falsey
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
      reservation=FactoryGirl.build(:reservation, :starts_at => Time.now-1.hour , :final_time => Time.now+1)
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
