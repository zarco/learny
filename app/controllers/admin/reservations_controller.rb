class Admin::ReservationsController < ApplicationController
  before_action :set_venue, only: [:index, :new, :create]
  before_action :set_reservation, only: [:show, :edit, :update, :destroy]

  # GET /admin/reservations
  # GET /admin/reservations.json
  def index
    @reservations = @venue.reservations.page params[:page]
  end

  # GET /admin/reservations/1
  # GET /admin/reservations/1.json
  def show
  end

  # GET /admin/reservations/new
  def new
    @reservation = Reservation.new
  end

  # GET /admin/reservations/1/edit
  def edit
  end

  # POST /admin/reservations
  # POST /admin/reservations.json
  def create
    @reservation = @venue.reservations.build(reservation_params)

    respond_to do |format|
      if @reservation.save
        format.html { redirect_to [:admin,@venue, @reservation], notice: 'Reservation was successfully created.' }
        format.json { render action: 'show', status: :created, location: @reservation }
      else
        format.html { render action: 'new' }
        format.json { render json: @reservation.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /admin/reservations/1
  # PATCH/PUT /admin/reservations/1.json
  def update
    respond_to do |format|
      if @reservation.update(reservation_params)
        format.html { redirect_to [:admin, @venue, @reservation], notice: 'Reservation was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @reservation.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /admin/reservations/1
  # DELETE /admin/reservations/1.json
  def destroy
    @reservation.destroy
    respond_to do |format|
      format.html { redirect_to admin_venue_reservations_path(@venue), notice: 'Reservation was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_venue
      @venue = Venue.find(params[:venue_id])      
    end
    
    def set_reservation
      set_venue
      @reservation = Reservation.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def reservation_params
      params.require(:reservation).permit(:starts_at, :final_time, :max_participants, :calendar_id, :cover)
    end
end
