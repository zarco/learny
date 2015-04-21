class Admin::CalendarsController < ApplicationController
  before_action :set_venue, only: [:index, :new]
  before_action :set_calendar, only: [:show, :edit, :update, :destroy]


  # GET /admin/calendars
  # GET /admin/calendars.json
  def index
    @calendars = @venue.calendars
  end

  # GET /admin/calendars/1
  # GET /admin/calendars/1.json
  def show
  end

  # GET /admin/calendars/new
  def new
    @calendar = @venue.calendars.build
  end

  # GET /admin/calendars/1/edit
  def edit
  end

  # POST /admin/calendars
  # POST /admin/calendars.json
  def create
    @calendar = @venue.calendars.build(calendar_params)
    respond_to do |format|
      if @calendar.save
        format.html { redirect_to [:admin, @calendar], notice: 'Calendar was successfully created.' }
        format.json { render action: 'show', status: :created, location: @calendar }
      else
        format.html { render action: 'new' }
        format.json { render json: @calendar.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /admin/calendars/1
  # PATCH/PUT /admin/calendars/1.json
  def update
    respond_to do |format|
      if @calendar.update(calendar_params)
        format.html { redirect_to [:admin, @calendar], notice: 'Calendar was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @calendar.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /admin/calendars/1
  # DELETE /admin/calendars/1.json
  def destroy
    @calendar.destroy
    respond_to do |format|
      format.html { redirect_to admin_calendars_url, notice: 'Calendar was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_venue
      @venue = Venue.find(params[:venue_id])      
    end
    
    def set_calendar
      set_venue
      @calendar = Calendar.find(params[:id])
    end


    # Never trust parameters from the scary internet, only allow the white list through.
    def calendar_params
      params.require(:calendar).permit(:title, :is_default)
    end
end
