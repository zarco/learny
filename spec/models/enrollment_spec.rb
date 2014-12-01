

RSpec.describe Enrollment, :type => :model do
  describe 'factories' do
    it 'has a valid factory' do
      expect(FactoryGirl.build(:enrollment)).to be_valid
    end
    it 'has an invalid factory' do
      expect(FactoryGirl.build(:invalid_enrollment)).to_not be_valid
    end
  end
  
  describe 'associations' do
    subject {FactoryGirl.build(:enrollment)}
    it { should belong_to(:student) }
    it { should belong_to(:workshop) }
  end
  
  describe 'validations' do
    subject { FactoryGirl.build(:enrollment) }
    it { should validate_presence_of :student }
    it { should validate_presence_of :workshop }
  end
end
