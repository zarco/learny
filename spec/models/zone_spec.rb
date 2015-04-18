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
  
  describe 'soft delete' do
    let(:zone){
      FactoryGirl.create(:zone)
    }

    it "deleted" do
      expect(zone.deleted?).to be_falsey
      expect(Zone.all.to_a).to eql([zone])
      zone.destroy
      expect(zone.deleted?).to be_truthy
      expect(Zone.all.to_a).to eql([])
      expect(Zone.with_deleted.to_a).to eql([zone])
    end

    it "really deleted" do
      expect(zone.deleted?).to be_falsey
      expect(Zone.all.to_a).to eql([zone])
      zone.really_destroy!
      expect(zone.deleted?).to be_truthy
      expect(Zone.all.to_a).to eql([])
      expect(Zone.with_deleted.to_a).to eql([])
    end
  end
end
