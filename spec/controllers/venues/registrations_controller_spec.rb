require 'rails_helper'

RSpec.describe Venues::RegistrationsController, :type => :controller do

  include Devise::TestHelpers
  fixtures :all
  render_views

  before(:each) do
    @request.env["devise.mapping"] = Devise.mappings[:venue]
  #@venue=User.create! FactoryGirl.attributes_for(:user)
  end

  describe 'POST :create' do
    context 'With valid data' do
      it 'Creates a new venue in db' do
        expect {
          post :create, :venue => FactoryGirl.attributes_for(:venue, :email => 'foo@bar.com' )
          expect(response).to redirect_to(root_path)
        }.to change(Venue, :count).by(1)
        
        v=Venue.first
        c=v.calendars.first
        expect(c.title).to eq("default")
        expect(c.is_default).to be_truthy
      end
    end

    context 'With invalid data' do
      it 'Does not create venue db' do
        expect{
          post :create, :venue => FactoryGirl.attributes_for(:invalid_venue)
        }.to_not change(Venue, :count)
      end
    end
  end
end
