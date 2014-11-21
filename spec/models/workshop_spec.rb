require 'spec_helper'

describe Workshop do
  describe 'factories' do
    it 'has a valid factory' do
      expect(FactoryGirl.build(:workshop)).to be_valid
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
  end


  describe 'associations' do
    subject {FactoryGirl.build(:workshop)}
    it { should belong_to(:expert)}
    it { should have_one(:reservation)}
  end

  describe 'validations' do
    subject { FactoryGirl.build(:workshop) }
    it { should validate_presence_of :name }
    it { should validate_presence_of :agenda }
    it { should validate_presence_of :length }
    it { should validate_presence_of :price }
    it { should respond_to :description}
  end
  
end