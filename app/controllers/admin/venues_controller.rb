class Admin::VenuesController < ApplicationController
  before_action :set_admin_venue, only: [:show, :edit, :update, :destroy]

  before_filter :authenticate_administrator!

  # GET /admin/venues
  # GET /admin/venues.json
  def index
    @venues = Venue.all
  end

  # GET /admin/venues/1
  # GET /admin/venues/1.json
  def show
  end

  # GET /admin/venues/new
  def new
    @admin_venue = Venue.new
  end

  # GET /admin/venues/1/edit
  def edit
  end

  # POST /admin/venues
  # POST /admin/venues.json
  def create
    @admin_venue = Venue.new(admin_venue_params)

    respond_to do |format|
      if @admin_venue.save
        format.html { redirect_to @admin_venue, notice: 'Venue was successfully created.' }
        format.json { render :show, status: :created, location: @admin_venue }
      else
        format.html { render :new }
        format.json { render json: @admin_venue.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /admin/venues/1
  # PATCH/PUT /admin/venues/1.json
  def update
    respond_to do |format|
      if @admin_venue.update(admin_venue_params)
        format.html { redirect_to @admin_venue, notice: 'Venue was successfully updated.' }
        format.json { render :show, status: :ok, location: @admin_venue }
      else
        format.html { render :edit }
        format.json { render json: @admin_venue.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /admin/venues/1
  # DELETE /admin/venues/1.json
  def destroy
    @admin_venue.destroy
    respond_to do |format|
      format.html { redirect_to admin_venues_url, notice: 'Venue was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_admin_venue
      @admin_venue = Venue.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def admin_venue_params
      params[:admin_venue]
    end
end
