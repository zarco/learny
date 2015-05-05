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
    
    it { should validate_numericality_of(:rating_workshop) }
    it { should_not allow_value(-1).for(:rating_workshop) }
    it { should_not allow_value(1.1).for(:rating_workshop) }
    it { should_not allow_value(6).for(:rating_workshop) }
    it { should_not allow_value('a').for(:rating_workshop) }
    it { should allow_value(0).for(:rating_workshop)}
    it { should allow_value(5).for(:rating_workshop)}
    
    it { should validate_numericality_of(:rating_expert) }
    it { should_not allow_value(-1).for(:rating_expert) }
    it { should_not allow_value(1.1).for(:rating_expert) }
    it { should_not allow_value(6).for(:rating_expert) }
    it { should_not allow_value('a').for(:rating_expert) }
    it { should allow_value(0).for(:rating_expert)}
    it { should allow_value(5).for(:rating_expert)}
    
    it { should validate_numericality_of(:rating_venue) }
    it { should_not allow_value(-1).for(:rating_venue) }
    it { should_not allow_value(1.1).for(:rating_venue) }
    it { should_not allow_value(6).for(:rating_venue) }
    it { should_not allow_value('a').for(:rating_venue) }
    it { should allow_value(0).for(:rating_venue)}
    it { should allow_value(5).for(:rating_venue)}
    
    it { should validate_numericality_of(:rating_learny) }
    it { should_not allow_value(-1).for(:rating_learny) }
    it { should_not allow_value(1.1).for(:rating_learny) }
    it { should_not allow_value(6).for(:rating_learny) }
    it { should_not allow_value('a').for(:rating_learny) }
    it { should allow_value(0).for(:rating_learny)}
    it { should allow_value(5).for(:rating_learny)}    
  end
  
  describe 'workshop validations' do
    describe 'only for given workshop' do
      
    end
    
    describe 'one per enrolled student' do
      
    end 
    
    describe 'only for enrolled student' do
      
    end
  end
end
