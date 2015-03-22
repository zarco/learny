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
    it { should respond_to :deleted_at }
  end

  describe 'soft delete' do
    let(:enrollment){
      FactoryGirl.create(:enrollment)
    }

    it "deleted" do
      expect(enrollment.deleted?).to be_falsey
      expect(Enrollment.all.to_a).to eql([enrollment])
      enrollment.destroy
      expect(enrollment.deleted?).to be_truthy
      expect(Enrollment.all.to_a).to eql([])
      expect(Enrollment.with_deleted.to_a).to eql([enrollment])
    end

    it "really deleted" do
      expect(enrollment.deleted?).to be_falsey
      expect(Enrollment.all.to_a).to eql([enrollment])
      enrollment.really_destroy!
      expect(enrollment.deleted?).to be_truthy
      expect(Enrollment.all.to_a).to eql([])
      expect(Enrollment.with_deleted.to_a).to eql([])
    end
  end
end
