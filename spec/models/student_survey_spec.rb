require 'spec_helper'

describe StudentSurvey do
  describe 'factories' do
    it 'has a valid factory' do
      expect(FactoryGirl.build(:student_survey)).to be_valid
    end
    it 'has an invalid factory' do
      expect(FactoryGirl.build(:invalid_student_survey)).to_not be_valid
    end
  end
  describe 'attributes' do
    subject { FactoryGirl.build(:student_survey) }
    it { should respond_to :rating_workshop }
    it { should respond_to :rating_expert }
    it { should respond_to :rating_venue }
    it { should respond_to :rating_learny }
    it { should respond_to :workshop_comment }
    it { should respond_to :venue_comment }
  end
  
  describe 'associations' do
    subject {FactoryGirl.build(:student_survey)}
    it { should belong_to(:student)}
    it { should belong_to(:workshop)}
  end
  
  describe 'validations' do
    subject { FactoryGirl.build(:student_survey) }
    it { should validate_presence_of :rating_workshop }
    it { should validate_presence_of :rating_expert }
    it { should validate_presence_of :rating_venue }
    it { should validate_presence_of :rating_learny }
  end
end
