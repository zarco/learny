require 'rails_helper'

RSpec.describe Administrator, :type => :model do

  describe 'factories' do
    it 'has a valid factory' do
      expect(FactoryGirl.build(:administrator)).to be_valid
    end
    it 'has an invalid factory' do
      expect(FactoryGirl.build(:invalid_administrator)).to_not be_valid
    end
  end
  describe 'attributes' do
    subject { FactoryGirl.build(:administrator) }
    it { should respond_to :name }
    it { should respond_to :email }
    it { should respond_to :password }
  end
end
