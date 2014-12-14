class WorkshopsController < ApplicationController
  before_action :set_workshop, only: [:show, :edit, :update, :destroy]
  before_filter :authenticate_expert!, only: [:create, :update, :destroy]
  
  # GET /workshops
  # GET /workshops.json
  def index
    w=params[:w]
    if !w.nil?
      @workshops = Workshop.search_workshop(w)
      render 'search'  
    elsif expert_signed_in? 
      @workshops = current_expert.workshops
    elsif student_signed_in?
      
    else
      
    end 
       
  end

  # GET /workshops/1
  # GET /workshops/1.json
  def show
    @enrollment = Enrollment.where(:student => current_student, :workshop => @workshop).first 
    @enrollment = Enrollment.new(:student => current_student, :workshop => @workshop) if @enrollment.nil?
  end

  # GET /workshops/new
  def new
    @workshop = Workshop.new
    @workshop.reservation=Reservation.new
  end

  # GET /workshops/1/edit
  def edit
  end

  # POST /workshops
  # POST /workshops.json
  def create
    reservation_id=workshop_params[:reservation][:id]
    @reservation=Reservation.find(reservation_id) if !reservation_id.empty?
    
    @workshop = Workshop.new(workshop_params.except(:reservation) )
    @workshop.expert=current_expert
    
    reservation_saved = true
    if !@reservation.nil?
      @reservation.workshop=@workshop
      @workshop.state=:scheduled
      reservation_saved=@reservation.save
      #TODO Enviar notifiacion a establecimiento de que un curso ha sido calendarizado 
    end  
    
    respond_to do |format|
      if @workshop.save && reservation_saved
        format.html { redirect_to root_path, notice: I18n.t('views.legends.workshop.proposed_successfully',default: 'Workshop successfully proposed.') }
        format.json { render :show, status: :created, location: @workshop }
      else
        format.html { render :new}
        format.json { render json: @workshop.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /workshops/1
  # PATCH/PUT /workshops/1.json
  def update
    respond_to do |format|
      
      reservation_id=workshop_params[:reservation][:id]
      if reservation_id.empty?
        updated=@workshop.update(workshop_params.except(:reservation))
      else
        @released_reservation=Reservation.where(:workshop_id => params[:id]).first
        @released_reservation.workshop_id = nil if !@released_reservation.nil?
       
        @reservation=Reservation.find(reservation_id)
        @reservation.workshop=@workshop
          
        @released_reservation.save if !@released_reservation.nil?
        updated=@workshop.update(workshop_params.except(:reservation)) && @reservation.save 
      end
      
      if updated 
        format.html { redirect_to @workshop, notice: 'Workshop was successfully updated.' }
        format.json { render :show, status: :ok, location: @workshop }
      else
        format.html { render :edit }
        format.json { render json: @workshop.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /workshops/1
  # DELETE /workshops/1.json
  def destroy
    @workshop.destroy
    respond_to do |format|
      format.html { redirect_to workshops_url, notice: 'Workshop was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_workshop
    @workshop = Workshop.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def workshop_params
    params.require(:workshop).permit(:name, :target_public, :agenda, :previous_skills, :price, :length, :max_number_participants, :description, reservation: [:id])
  end
end
