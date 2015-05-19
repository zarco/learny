require 'spec_helper'

describe StudentSurvey do
  describe 'factories' do
    it 'has a valid factory' do
      survey=FactoryGirl.build(:student_survey)
      survey.valid?
      puts survey.errors.full_messages
      expect(survey).to be_valid
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
    
    
    it { should validate_presence_of :student }

  end

  describe 'workshop validations' do
    let(:workshop){
      FactoryGirl.create(:workshop)
    }
    
    let(:given_workshop){
      FactoryGirl.create(:given_workshop)
    }
    
    let(:student){
      FactoryGirl.create(:student)
    }
        
    
    describe 'new surveys' do

      it 'ok' do
        enrollment=Enrollment.create(workshop:given_workshop, student: student)
        expect(enrollment.persisted?).to be_truthy
        
        
        expect(given_workshop.student_survey_done? student).to be_falsey
        expect(given_workshop.given?).to be_truthy
        expect(given_workshop.student_enrolled?(student)).to be_truthy
        survey=StudentSurvey.new(workshop: given_workshop, student: student)
        #survey.valid?
        #puts survey.errors.full_messages
        expect(survey.valid?).to be_truthy
      end

      it 'not given state' do
        enrollment=Enrollment.create(workshop:workshop, student: student)
        expect(enrollment.persisted?).to be_truthy

        expect(workshop.given?).to be_falsey
        survey=StudentSurvey.new(workshop:workshop, student: student)
        #survey.valid?
        #puts survey.errors.full_messages
        expect(survey.valid?).to be_falsey
      end
    end

    describe 'one per enrolled student' do
      it 'student already completed the survey' do
        enrollment=Enrollment.create(workshop:given_workshop, student: student)
        expect(enrollment.persisted?).to be_truthy
        
        expect(given_workshop.given?).to be_truthy
        expect(given_workshop.student_enrolled?(student)).to be_truthy
        expect(given_workshop.student_survey_done? student).to be_falsey
        survey=StudentSurvey.create(workshop: given_workshop, student: student)
        #survey.valid?
        #puts survey.errors.full_messages
        expect(survey.valid?).to be_truthy
        other_survey=StudentSurvey.new(workshop: given_workshop, student: student)
        #survey.valid?
        #puts survey.errors.full_messages
        expect(other_survey.valid?).to be_falsey
      end
    end

    describe 'only for enrolled student' do
      it "student did not enrolled to the workshop" do
        other_student=FactoryGirl.create(:student)
        expect(given_workshop.given?).to be_truthy
        expect(given_workshop.student_enrolled?(other_student)).to be_falsey
        survey=StudentSurvey.new(workshop: given_workshop, student: other_student)
        #survey.valid?
        #puts survey.errors.full_messages
        expect(survey.valid?).to be_falsey
      end
    end

  end
end
