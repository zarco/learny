require 'rails_helper'

describe  do
  describe 'factories' do
    it 'has a valid factory' do
      expect(FactoryGirl.build(:zone)).to be_valid
    end
    it 'has an invalid factory' do
      expect(FactoryGirl.build(:invalid_zone)).to_not be_valid
    end
  end
  describe 'attributes' do
    subject { FactoryGirl.build(:zone) }
    it { should respond_to :name }
  end

  describe 'associations' do
    subject {FactoryGirl.build(:zone)}
    it { should have_many(:workshops)}
  end
end
