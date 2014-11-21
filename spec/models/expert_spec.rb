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
  end
  
  describe 'associations' do
    subject {FactoryGirl.build(:expert)}
    it { should have_many(:workshops)}
  end

end