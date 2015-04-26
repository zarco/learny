require 'rails_helper'

# This spec was generated by rspec-rails when you ran the scaffold generator.
# It demonstrates how one might use RSpec to specify the controller code that
# was generated by Rails when you ran the scaffold generator.
#
# It assumes that the implementation code is generated by the rails scaffold
# generator.  If you are using any extension libraries to generate different
# controller code, this generated spec may or may not pass.
#
# It only uses APIs available in rails and/or rspec-rails.  There are a number
# of tools you can use to make these specs even more expressive, but we're
# sticking to rails and rspec-rails APIs to keep things simple and stable.
#
# Compared to earlier versions of this generator, there is very limited use of
# stubs and message expectations in this spec.  Stubs are only used when there
# is no simpler way to get a handle on the object needed for the example.
# Message expectations are only used when there is no simpler way to specify
# that an instance is receiving a specific message.

RSpec.describe WorkshopsController, :type => :controller do

  include Devise::TestHelpers

  before(:each) do
    @expert=FactoryGirl.create(:expert)
    @expert.confirm!
    sign_in @expert
  end

  let(:zone){
    FactoryGirl.create(:zone)
  }

  # This should return the minimal set of attributes required to create a valid
  # Workshop. As you add validations to Workshop, be sure to
  # adjust the attributes here as well.
  let(:valid_attributes) {
    FactoryGirl.attributes_for(:workshop, expert_id: @expert.id, zone_id: zone.id)
  }

  let(:invalid_attributes) {
    FactoryGirl.attributes_for(:invalid_workshop)
  }

  # This should return the minimal set of values that should be in the session
  # in order to pass any filters (e.g. authentication) defined in
  # WorkshopsController. Be sure to keep this updated too.
  let(:valid_session) { {} }

  describe "GET index" do
    it "assigns all workshops as @workshops" do
      workshop = Workshop.create! valid_attributes
      get :index, {}, valid_session
      expect(assigns(:workshops)).to eq([workshop])
    end
  end

  describe "GET show" do
    it "assigns the requested workshop as @workshop" do
      workshop = Workshop.create! valid_attributes
      get :show, {:id => workshop.to_param}, valid_session
      expect(assigns(:workshop)).to eq(workshop)
    end
  end

  describe "GET new" do
    it "assigns a new workshop as @workshop" do
      get :new, {}, valid_session
      expect(assigns(:workshop)).to be_a_new(Workshop)
    end
  end

  describe "GET edit" do
    it "assigns the requested workshop as @workshop" do
      workshop = Workshop.create! valid_attributes
      get :edit, {:id => workshop.to_param}, valid_session
      expect(assigns(:workshop)).to eq(workshop)
    end
  end

  describe "POST create" do
    describe "with valid params" do
      it "creates a new Workshop" do
        expect {
          post :create, {:workshop => valid_attributes}, valid_session
        }.to change(Workshop, :count).by(1)
      end

      it "creates a new Workshop with an existing Reservation" do
        venue=FactoryGirl.create(:venue)
        reservation=FactoryGirl.create(:reservation, :calendar => venue.calendars.first)
        workshop=FactoryGirl.attributes_for(:workshop, zone_id: zone.id, :reservation_attributes => {id: reservation.to_param})
        expect {
          post :create, {:workshop => workshop}, valid_session
        }.to change(Workshop, :count).by(1)
        p_workshop=Workshop.last
        expect(p_workshop.reservation).to_not be_nil
        expect(p_workshop.reservation.id).to eql(reservation.id)
        expect(p_workshop.state).to eql('scheduled')
      end

      it "creates a new Workshop with a blank reservation" do
        workshop=FactoryGirl.attributes_for(:workshop, zone_id: zone.id, :reservation_attributes => {:id => ''})
        expect {
          post :create, {:workshop => workshop}, valid_session
        }.to change(Workshop, :count).by(1)
        p_workshop=Workshop.last
        expect(p_workshop.reservation).to be_nil
        expect(p_workshop.state).to eql('proposed')
      end

    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved workshop as @workshop" do
        post :create, {:workshop => invalid_attributes}, valid_session
        expect(assigns(:workshop)).to be_a_new(Workshop)
      end

      it "re-renders the 'new' template" do
        post :create, {:workshop => invalid_attributes}, valid_session
        expect(response).to render_template("new")
      end

      it "with not suitable reservation" do
        venue=FactoryGirl.create(:venue)
        reservation=FactoryGirl.create(:reservation, :calendar => venue.calendars.first)
        workshop=FactoryGirl.attributes_for(:workshop, zone_id: zone.id, :reservation_attributes => {id: reservation.to_param})
        expect {
          post :create, {:workshop => workshop.merge({:max_number_participants => 1000})}, valid_session
        }.to_not change(Workshop, :count)
      end
    end
  end

  describe "PUT update" do
    describe "with valid params" do
      let(:new_attributes) {
        FactoryGirl.attributes_for(:workshop, :name => 'Basic Dutch')
      }

      it "updates only the requested workshop" do
        workshop = Workshop.create! valid_attributes
        put :update, {:id => workshop.to_param, :workshop => new_attributes}, valid_session
        workshop=Workshop.find(workshop.to_param)
        expect(workshop.name).to eql(new_attributes[:name])
      end

      it "updates the requested workshop with reservation" do
        venue=FactoryGirl.create(:venue)
        reservation=FactoryGirl.create(:reservation, :calendar => venue.calendars.first)
        new_reservation=FactoryGirl.create(:other_reservation, :calendar => venue.calendars.first)

        workshop=FactoryGirl.create(:workshop)
        workshop.update(:reservation => reservation)

        put :update, {:id => workshop.to_param, :workshop => new_attributes.merge(:reservation_attributes => {id: new_reservation.to_param})}, valid_session
        workshop.reload
        
        expect(workshop.name).to eql(new_attributes[:name])
        expect(workshop.reservation).to_not be_nil
        expect(workshop.reservation.id).to eql(new_reservation.id)
        expect(workshop.reservation.id).to_not eql(reservation.id)

      end

      it "assigns the requested workshop as @workshop" do
        workshop = Workshop.create! valid_attributes
        put :update, {:id => workshop.to_param, :workshop => valid_attributes}, valid_session
        expect(assigns(:workshop)).to eq(workshop)
      end

      it "redirects to the workshop" do
        workshop = Workshop.create! valid_attributes
        put :update, {:id => workshop.to_param, :workshop => valid_attributes}, valid_session
        expect(response).to redirect_to(workshop)
      end
    end

    describe "with invalid params" do
      let(:new_attributes) {
        FactoryGirl.attributes_for(:workshop, :name => 'Basic Dutch')
      }

      it "assigns the workshop as @workshop" do
        workshop = Workshop.create! valid_attributes
        put :update, {:id => workshop.to_param, :workshop => invalid_attributes}, valid_session
        expect(assigns(:workshop)).to eq(workshop)
      end

      it "re-renders the 'edit' template" do
        workshop = Workshop.create! valid_attributes
        put :update, {:id => workshop.to_param, :workshop => invalid_attributes}, valid_session
        expect(response).to render_template("edit")
      end

      it "updates the requested workshop with not suitable reservation" do
        venue=FactoryGirl.create(:venue)
        reservation=FactoryGirl.create(:reservation, :calendar => venue.calendars.first)
        new_reservation=FactoryGirl.create(:other_reservation, :max_participants=>1,:calendar => venue.calendars.first)

        workshop=FactoryGirl.create(:workshop, valid_attributes)
        workshop.update(:reservation => reservation)

        put :update, {:id => workshop.to_param, :workshop => new_attributes.merge(:reservation_attributes => {id: new_reservation.to_param})}, valid_session
        workshop.reload

        expect(workshop.reservation).to_not be_nil
        expect(workshop.reservation.id).to eql(reservation.id)
        expect(workshop.reservation.id).to_not eql(new_reservation.id)
        
        expect(workshop.name).to eql(valid_attributes[:name])
        expect(workshop.name).to_not eql(new_attributes[:name])
      end

    end
  end

  describe "DELETE destroy" do
    it "destroys the requested workshop" do
      workshop = Workshop.create! valid_attributes
      expect {
        delete :destroy, {:id => workshop.to_param}, valid_session
      }.to change(Workshop, :count).by(-1)
    end

    it "redirects to the workshops list" do
      workshop = Workshop.create! valid_attributes
      delete :destroy, {:id => workshop.to_param}, valid_session
      expect(response).to redirect_to(workshops_url)
    end
  end

end
