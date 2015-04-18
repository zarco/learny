require 'spec_helper'

describe Workshop do
  describe 'factories' do
    it 'has a valid factory' do
      expect(FactoryGirl.build(:workshop)).to be_valid
    end
    it 'has a valid factory with reservation' do
      expect(FactoryGirl.build(:workshop_with_reservation)).to be_valid
    end
    it 'has a valid factory for free workshop' do
      expect(FactoryGirl.build(:workshop,:free)).to be_valid
    end
    it 'has an invalid factory' do
      expect(FactoryGirl.build(:invalid_workshop)).to_not be_valid
    end
  end

  describe 'attributes' do
    subject { FactoryGirl.build(:workshop) }
    it { should respond_to :name }
    it { should respond_to :agenda }
    it { should respond_to :length }
    it { should respond_to :price }
    it { should respond_to :description}
    it { should respond_to :max_number_participants}
    it { should respond_to :min_number_participants}
    it { should respond_to :free}
    it { should respond_to :deleted_at }
  end

  describe 'associations' do
    subject {FactoryGirl.build(:workshop)}
    it { should belong_to(:expert)}
    it { should have_one(:reservation)}
    it { should have_one(:calendar)}
    it { should have_one(:venue)}
    it { should belong_to(:zone)}
    it { should have_many(:enrollments)}
    it { should have_many(:students)}
  
  end

  describe 'validations_for_not_free_workshop' do
    subject { FactoryGirl.build(:workshop) }
    it { should validate_presence_of :name }
    it { should validate_presence_of :agenda }
    it { should validate_presence_of :length }
    it { should validate_presence_of :price }
    it { should validate_presence_of :expert }
    it { should validate_presence_of :zone }
    it { should validate_presence_of :description }
    it { should validate_presence_of :max_number_participants }
    it { should validate_presence_of :min_number_participants }
    it { should validate_numericality_of(:length) }
    it { should validate_numericality_of(:max_number_participants) }
    it { should validate_numericality_of(:min_number_participants) }
    it { should validate_numericality_of(:price) }
    it { should_not allow_value(-1).for(:length) }
    it { should_not allow_value(-1).for(:max_number_participants) }
    it { should_not allow_value(-1).for(:min_number_participants) }
    it { should_not allow_value(-1).for(:price) }
    it { should_not allow_value(0).for(:length) }
    it { should_not allow_value(0).for(:max_number_participants) }
    it { should_not allow_value(0).for(:min_number_participants) }
    it { should_not allow_value(0).for(:price) }
    it { should_not allow_value('Z').for(:length) }
    it { should_not allow_value('Z').for(:price) }
    it { should_not allow_value('Z').for(:max_number_participants) }
    it { should_not allow_value('Z').for(:min_number_participants) }
    it { should allow_value(1).for(:length) }
    it { should allow_value(1).for(:max_number_participants) }
    it { should allow_value(1).for(:min_number_participants) }
    it { should allow_value(1).for(:price) }
    it { should_not allow_value(1.1).for(:length) }
    it { should_not allow_value(1.1).for(:max_number_participants) }
    it { should_not allow_value(1.1).for(:min_number_participants) }
    it { should allow_value(1.1).for(:price) }
  end

  describe 'validations_for_free_workshop' do
    subject { FactoryGirl.build(:workshop,:free) }
    it { should allow_value(0).for(:price) }
    it { should allow_value(1).for(:price) }
    it { should allow_value(1.1).for(:price) }
    it { should_not allow_value(-1).for(:price) }
    it { should allow_value(nil).for(:price) }

    it 'price when set a workshop for free' do
      workshop=FactoryGirl.build(:workshop)
      expect(workshop.free?).to be_falsey
      expect(workshop.price).to_not be_nil
      workshop.free=true
      expect(workshop.free?).to be_truthy
      expect(workshop.price).to be_nil
    end

    it 'free value when set a price to a workshop' do
      workshop=FactoryGirl.build(:workshop, :free)
      expect(workshop.free?).to be_truthy
      expect(workshop.price).to be_nil
      workshop.price=5000
      expect(workshop.free?).to be_truthy
      expect(workshop.price).to_not be_nil
      expect(workshop.valid?).to be_truthy
      expect(workshop.free?).to be_truthy
      expect(workshop.price).to be_nil
    end

  end

  describe 'validation when updating a workshop' do
    context 'with reservation' do
      let(:workshop){
        FactoryGirl.create(:workshop_with_reservation)
      }

      it "number of max participants is superior than allowed by reservation" do
        workshop.max_number_participants=120
        expect(workshop.valid?).to be_falsey
        expect(workshop.save).to be_falsey
        expect(workshop.errors).to have_key(:max_number_participants)
      end

      it "length in hours is superior than allowed by reservation" do
        workshop.length=100
        expect(workshop.valid?).to be_falsey
        expect(workshop.save).to be_falsey
        expect(workshop.errors).to have_key(:lenght)
      end

      it "min number participants" do
        workshop.min_number_participants=1000
        expect(workshop.valid?).to be_falsey
        expect(workshop.save).to be_falsey
        expect(workshop.errors).to have_key(:min_number_participants)
      end

    end

    context 'without reservation' do
      let(:workshop){
        FactoryGirl.create(:workshop)
      }

      it "number of max participants is not limited" do
        workshop.max_number_participants=120
        expect(workshop.valid?).to be_truthy
        expect(workshop.save).to be_truthy
        expect(workshop.errors).to_not have_key(:max_number_participants)
      end

      it "length in hours is not limited" do
        workshop.length=100
        expect(workshop.valid?).to be_truthy
        expect(workshop.save).to be_truthy
        expect(workshop.errors).to_not have_key(:lenght)
      end
    end

  end

  describe 'reservation changes' do

    it 'nil to reservation' do
      workshop=FactoryGirl.create(:workshop)
      new_reservation=FactoryGirl.create(:reservation)
      expect(workshop.reservation).to be_nil
      changed=workshop.send(:reservation_changes,new_reservation.id)
      expect(changed).to be_truthy
    end

    it 'reservation to other reservation' do
      reservation=FactoryGirl.create(:reservation)
      workshop=FactoryGirl.create(:workshop, reservation: reservation)
      new_reservation=FactoryGirl.create(:reservation)
      expect(workshop.reservation).to_not be_nil
      expect(workshop.send(:reservation_changes,new_reservation.id)).to be_truthy
    end

    it 'reservation to nil' do
      reservation=FactoryGirl.create(:reservation)
      workshop=FactoryGirl.create(:workshop, reservation: reservation)
      expect(workshop.reservation).to_not be_nil
      expect(workshop.send(:reservation_changes,nil)).to be_truthy
    end

    it 'no changes' do
      reservation=FactoryGirl.create(:reservation)
      workshop=FactoryGirl.create(:workshop, reservation: reservation)
      expect(workshop.reservation).to_not be_nil
      expect(workshop.send(:reservation_changes,reservation.id)).to be_falsey
    end

    it 'no changes nil to nil' do
      workshop=FactoryGirl.create(:workshop)
      expect(workshop.reservation).to be_nil
      expect(workshop.send(:reservation_changes,nil)).to be_falsey
    end
  end

  describe 'soft delete' do
    let(:workshop){
      FactoryGirl.create(:workshop)
    }

    it "deleted" do
      expect(workshop.deleted?).to be_falsey
      expect(Workshop.all.to_a).to eql([workshop])
      workshop.destroy
      expect(workshop.deleted?).to be_truthy
      expect(Workshop.all.to_a).to eql([])
      expect(Workshop.with_deleted.to_a).to eql([workshop])
    end

    it "really deleted" do
      expect(workshop.deleted?).to be_falsey
      expect(Workshop.all.to_a).to eql([workshop])
      workshop.really_destroy!
      expect(workshop.deleted?).to be_truthy
      expect(Workshop.all.to_a).to eql([])
      expect(Workshop.with_deleted.to_a).to eql([])
    end
  end

end