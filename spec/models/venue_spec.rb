require 'spec_helper'

describe Venue do
  describe 'factories' do
    it 'has a valid factory' do
      expect(FactoryGirl.build(:venue)).to be_valid
    end
    it 'has an invalid factory' do
      expect(FactoryGirl.build(:invalid_venue)).to_not be_valid
    end
  end
  describe 'attributes' do
    subject { FactoryGirl.build(:venue) }
    it { should respond_to :name }
  end

end

