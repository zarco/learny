class Admin::ReservationsController < ApplicationController
  before_action :set_venue, only: [:index, :new, :create]
  before_action :set_workshop, only: [:index, :new, :create]
  before_action :set_reservation, only: [:show, :edit, :update, :destroy]
  # GET /admin/reservations
  # GET /admin/reservations.json
  def index
    @reservations = @venue.reservations.order(starts_at: :desc).page params[:page]
  end

  # GET /admin/reservations/1
  # GET /admin/reservations/1.json
  def show
  end

  # GET /admin/reservations/new
  def new
    @reservation = @workshop.present? ?
      Reservation.new(
        starts_at: @workshop.proposed_date,
        final_time: @workshop.proposed_final_time,
        max_participants: @workshop.max_number_participants)
      : Reservation.new
  end

  # GET /admin/reservations/1/edit
  def edit
  end

  # POST /admin/reservations
  # POST /admin/reservations.json
  def create
    @reservation = @venue.reservations.build(reservation_params) if @venue

    if @workshop
      @reservation = Reservation.new(reservation_params.merge(workshop_id: @workshop.id))
      @workshop.accepted_by_venue
    end

    respond_to do |format|
      if @reservation.save
        format.html { redirect_to [:admin,@parent, @reservation], notice: 'Reservation was successfully created.' }
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
        format.html { redirect_to [:admin, @reservation], notice: 'Reservation was successfully updated.' }
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
    @venue = Venue.find(params[:venue_id]) if params[:venue_id]
    @parent = @venue
  end

  def set_workshop
    @workshop = Workshop.find(params[:workshop_id]) if params[:workshop_id]
    @parent = @workshop
  end

  def set_reservation
    set_venue
    set_workshop
    @reservation = Reservation.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def reservation_params
    params.require(:reservation).permit(:starts_at, :final_time, :max_participants, :calendar_id, :cover)
  end
end
