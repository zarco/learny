class ReservationsController < ApplicationController
  before_action :set_reservation, only: [:show, :edit, :update, :destroy]

  before_filter {:authenticate_venue! || :authenticate_expert!}
  # GET /reservations
  # GET /reservations.json
  def index
    if venue_signed_in?
      index_for_venues  
    elsif expert_signed_in?
      index_for_experts
    end
  end

  # GET /reservations/1
  # GET /reservations/1.json
  def show
  end

  # GET /reservations/new
  def new
    @reservation = Reservation.new
  end

  # GET /reservations/1/edit
  def edit
  end

  # POST /reservations
  # POST /reservations.json
  def create
    @reservation = Reservation.create(reservation_params)
    respond_to do |format|
      if @reservation.save
        format.html { redirect_to @reservation.calendar, notice: 'Reservation was successfully created.' }
        format.json { render :index, status: :created }
      else
        format.html { render :new }
        format.json { render json: @reservation.errors, status: :unprocessable_entity, location: @reservation }
      end
    end
  end

  # PATCH/PUT /reservations/1
  # PATCH/PUT /reservations/1.json
  def update
    respond_to do |format|
      if @reservation.update(reservation_params)
        format.html { redirect_to @reservation, notice: 'Reservation was successfully updated.' }
        format.json { render :show, status: :ok, location: @reservation }
      else
        format.html { render :edit }
        format.json { render json: @reservation.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /reservations/1
  # DELETE /reservations/1.json
  def destroy
    @reservation.destroy
    respond_to do |format|
      format.html { redirect_to reservations_url, notice: 'Reservation was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  protected
  def index_for_venues       
    calendars_ids = []    
    current_venue.calendars.each do |c|      
      calendars_ids.push(c.id)  
    end
          
    @calendars=current_venue.calendars.where(:id => calendars_ids).joins('calendars') unless calendars_ids.empty?

  end
  
  
  def index_for_experts
    #@reservations=Reservation.where("starts_at >= :starts_at and workshop_id IS NULL", {starts_at: Date.parse(params[:starts_at])})
    @reservations=Reservation.find_availables(params)
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_reservation
    @reservation = Reservation.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def reservation_params
    params.require(:reservation).permit(:starts_at, :final_time, :max_participants, :cover, :all_day, :calendar_id)
  end
end