require 'spec_helper'

describe Expert do
  describe 'factories' do
    it 'has a valid factory' do
      expect(FactoryGirl.build(:expert)).to be_valid
    end
    it 'has an invalid factory' do
      expect(FactoryGirl.build(:invalid_expert)).to_not be_valid
    end
  end
  describe 'attributes' do
    subject { FactoryGirl.build(:expert) }
    it { should respond_to :first_name }
    it { should respond_to :last_name }
    it { should respond_to :occupation }
    it { should respond_to :profile }
    it { should respond_to :facebook_link }
    it { should respond_to :twitter_link }
    it { should respond_to :linkedin_link }
    #it { should respond_to :website }
    it { should respond_to :avatar }
    
  end
  
  describe 'associations' do
    subject {FactoryGirl.build(:expert)}
    it { should have_many(:workshops)}
  end
  
  describe 'methods' do
    it 'last name' do
      full_name=FactoryGirl.build(:expert, :first_name => 'Juan', :last_name => 'Perez').full_name
      expect(full_name).to eq("Juan Perez")
    end
  end

end