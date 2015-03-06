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
    it { should respond_to :google_plus_link }
    it { should respond_to :website }
    it { should respond_to :avatar }
    it { should respond_to :deleted_at }
  end

  describe 'validations' do
    subject { FactoryGirl.build(:expert) }
    it { should allow_value('www.fake.com').for(:website) }
    it { should allow_value('www.fake.com.mx').for(:website) }
    it { should allow_value('').for(:website) }
    it { should allow_value('facebook.com/fake').for(:facebook_link) }
    it { should allow_value('').for(:facebook_link) }
    it { should allow_value('@fake').for(:twitter_link) }
    it { should allow_value('').for(:twitter_link) }
    it { should allow_value('id=12345678').for(:linkedin_link) }
    it { should allow_value('').for(:linkedin_link) }
    it { should allow_value('+fake').for(:google_plus_link) }
    it { should allow_value('').for(:google_plus_link) }
    it { should_not allow_value('wwww.fake.com').for(:website) }
    it { should_not allow_value('wwww.fake.').for(:website) }
    it { should_not allow_value('http://wwww.fake.com').for(:website) }
    it { should_not allow_value('https://facebook.com/fake').for(:facebook_link) }
    it { should_not allow_value('www.facebook.com/fake').for(:facebook_link) }
    it { should_not allow_value('facebook.com/').for(:facebook_link) }
    it { should_not allow_value('@').for(:twitter_link) }
    it { should_not allow_value('fake@').for(:twitter_link) }
    it { should_not allow_value('id=').for(:linkedin_link) }
    it { should_not allow_value('+').for(:google_plus_link) }
    it { should_not allow_value('fake+').for(:google_plus_link) }
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

    it 'next workshops' do
      expert=FactoryGirl.create(:expert)
      workshop=FactoryGirl.create(:workshop, :expert => expert)
      venue=FactoryGirl.create(:venue)
      reservation=FactoryGirl.create(:reservation, :calendar => venue.calendars.first, :workshop => workshop,
      :starts_at => Date.new(2511,11,11))

      next_workshops=expert.next_workshops
      #puts next_workshops
      expect(next_workshops.count).to eq(1)
    end

    it 'next workshops' do
      expert=FactoryGirl.create(:expert)
      workshop=FactoryGirl.create(:workshop, :expert => expert)
      venue=FactoryGirl.create(:venue)
      reservation=FactoryGirl.build(:reservation, :calendar => venue.calendars.first,
      :workshop => workshop, :starts_at => Date.new(2011,11,11))
      reservation.save(:validate => false)
      prev_workshops=expert.previous_workshops

      #puts prev_workshops
      expect(prev_workshops.count).to eq(1)
    end

    it 'fmt_website' do
      website=FactoryGirl.build(:expert, :website => 'http://www.fake.com').fmt_website
      expect(website).to eq("www.fake.com")
    end

    it 'fmt_facebook_link' do
      facebook_link=FactoryGirl.build(:expert, :facebook_link => 'https://facebook.com/fake').fmt_facebook_link
      expect(facebook_link).to eq("facebook.com/fake")
    end

    it 'fmt_twitter_link' do
      twitter_link=FactoryGirl.build(:expert, :twitter_link => 'https://twitter.com/fake').fmt_twitter_link
      expect(twitter_link).to eq("@fake")
    end

    it 'fmt_google_plus_link' do
      google_plus_link=FactoryGirl.build(:expert, :google_plus_link => 'https://plus.google.com/+fake').fmt_google_plus_link
      expect(google_plus_link).to eq("+fake")
    end

    it 'fmt_linkedin_link' do
      linkedin_link=FactoryGirl.build(:expert, :linkedin_link => 'https://www.linkedin.com/profile/view?id=12345678').fmt_linkedin_link
      expect(linkedin_link).to eq("id=12345678")
    end
  end

  context 'soft delete' do
    describe 'only expert' do
      let(:expert){
        FactoryGirl.create(:expert)
      }

      it "deleted" do
        expect(expert.deleted?).to be_falsey
        expect(Expert.all.to_a).to eql([expert])
        expert.destroy
        expect(expert.deleted?).to be_truthy
        expect(Expert.all.to_a).to eql([])
        expect(Expert.with_deleted.to_a).to eql([expert])
      end

      it "really deleted" do
        expect(expert.deleted?).to be_falsey
        expect(Expert.all.to_a).to eql([expert])
        expert.really_destroy!
        expect(expert.deleted?).to be_truthy
        expect(Expert.all.to_a).to eql([])
        expect(Expert.with_deleted.to_a).to eql([])
      end
    end
  end

end