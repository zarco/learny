require 'spec_helper'

describe Student do
  describe 'factories' do
    it 'has a valid factory' do
      expect(FactoryGirl.build(:student)).to be_valid
    end
    it 'has an invalid factory' do
      expect(FactoryGirl.build(:invalid_student)).to_not be_valid
    end
  end
  describe 'attributes' do
    subject { FactoryGirl.build(:student) }
    it { should respond_to :first_name }
    it { should respond_to :last_name }
  end

end
