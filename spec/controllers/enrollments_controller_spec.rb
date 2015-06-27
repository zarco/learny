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

RSpec.describe EnrollmentsController, :type => :controller do

  include Devise::TestHelpers

  before(:each) do
    @student=FactoryGirl.create(:student)
    @student.confirm
    sign_in @student
  end


  # This should return the minimal set of attributes required to create a valid
  # Enrollment. As you add validations to Enrollment, be sure to
  # adjust the attributes here as well.
  let(:valid_attributes) {
    FactoryGirl.build(:enrollment, 
      :workshop => FactoryGirl.create(:workshop), 
      :student => @student).attributes
  }

  let(:invalid_attributes) {
    FactoryGirl.attributes_for(:invalid_enrollment)
  }

  # This should return the minimal set of values that should be in the session
  # in order to pass any filters (e.g. authentication) defined in
  # EnrollmentsController. Be sure to keep this updated too.
  let(:valid_session) {
  } 

  #describe "GET index" do
   # it "assigns all enrollments as @enrollments" do
    #  login_as :student
     # enrollment = Enrollment.create! valid_attributes
      #get :index, {}, valid_session
      #expect(assigns(:enrollments)).to eq([enrollment])
    #end
  #end

  describe "GET show" do
    it "assigns the requested enrollment as @enrollment" do
      enrollment = Enrollment.create! valid_attributes
      get :show, {:id => enrollment.to_param}, valid_session
      expect(assigns(:enrollment)).to eq(enrollment)
    end
  end

  describe "GET new" do
    it "assigns a new enrollment as @enrollment" do
      get :new, {}, valid_session
      expect(assigns(:enrollment)).to be_a_new(Enrollment)
    end
  end

  describe "GET edit" do
    it "assigns the requested enrollment as @enrollment" do
      enrollment = Enrollment.create! valid_attributes
      get :edit, {:id => enrollment.to_param}, valid_session
      expect(assigns(:enrollment)).to eq(enrollment)
    end
  end

  describe "POST create" do
    describe "with valid params" do
      it "creates a new Enrollment" do
        expect {
          post :create, {:enrollment => valid_attributes}, valid_session
        }.to change(Enrollment, :count).by(1)
      end

      it "assigns a newly created enrollment as @enrollment" do
        post :create, {:enrollment => valid_attributes}, valid_session
        expect(assigns(:enrollment)).to be_a(Enrollment)
        expect(assigns(:enrollment)).to be_persisted
      end

      it "redirects to the created enrollment" do
        post :create, {:enrollment => valid_attributes}, valid_session
        expect(response).to redirect_to(Workshop.last)
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved enrollment as @enrollment" do
        post :create, {:enrollment => invalid_attributes}, valid_session
        expect(assigns(:enrollment)).to be_a_new(Enrollment)
      end

      it "re-renders the 'new' template" do
        post :create, {:enrollment => invalid_attributes}, valid_session
        expect(response).to render_template("new")
      end
    end
  end

  
  describe "DELETE destroy" do
    it "destroys the requested enrollment" do
      enrollment = Enrollment.create! valid_attributes
      expect {
        delete :destroy, {:id => enrollment.to_param}, valid_session
      }.to change(Enrollment, :count).by(-1)
    end

    it "redirects to the enrollments list" do
      enrollment = Enrollment.create! valid_attributes
      delete :destroy, {:id => enrollment.to_param}, valid_session
      expect(response).to redirect_to(enrollments_url)
    end
  end

end
