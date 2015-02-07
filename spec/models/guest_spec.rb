require 'spec_helper'

RSpec.describe Guest, :type => :model do
  describe 'factories' do
    it 'has a valid factory' do
      expect(FactoryGirl.build(:guest)).to be_valid
    end
    it 'has an invalid factory' do
      expect(FactoryGirl.build(:invalid_guest)).to_not be_valid
    end
  end
  
  describe 'attributes' do
    subject { FactoryGirl.build(:guest) }
    it { should respond_to :name }
    it { should respond_to :email }
    it { should respond_to :workshop }
  end

  describe 'validations' do
    subject { FactoryGirl.build(:guest) }
    it { should validate_presence_of :name }
    it { should validate_presence_of :email }
    it { should validate_presence_of :workshop }
    it { should validate_uniqueness_of(:email).scoped_to(:workshop) }
  end
  
end
