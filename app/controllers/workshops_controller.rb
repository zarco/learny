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
      @workshops = current_expert.workshops.page params[:page]
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
    Workshop.transaction do
      @workshop = Workshop.create(workshop_params.except(:reservation_attributes).merge({:expert => current_expert}))
      unless workshop_params[:reservation_attributes].nil?
        reservation_id=workshop_params[:reservation_attributes][:id] 
        @workshop.update_reservation(reservation_id) if @workshop.persisted? && reservation_id
        #puts @workshop.errors.full_messages unless @workshop.valid?
        raise ActiveRecord::Rollback if @workshop.invalid?
      end        
    end
    respond_to do |format|
        if @workshop.persisted?
          #TODO Enviar notifiacion a establecimiento de que un curso ha sido calendarizado
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
      
      #reservation_id=workshop_params[:reservation][:id]
      #if reservation_id.empty?
      #  updated=@workshop.update(workshop_params.except(:reservation))
      #else
       # @released_reservation=Reservation.where(:workshop_id => params[:id]).first
       # @released_reservation.workshop_id = nil if !@released_reservation.nil?
       
       # @reservation=Reservation.find(reservation_id)
       # @reservation.workshop=@workshop
          
       # @released_reservation.save if !@released_reservation.nil?
       # updated=  @workshop.update(workshop_params.except(:reservation)) && @reservation.save 
      #end
      
      Workshop.transaction do
        
        puts ">>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>><<<<<"
        puts workshop_params[:reservation_attributes]
        puts ">>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>><<<<<"
        
        
        unless workshop_params[:reservation_attributes].nil?
          reservation_id=workshop_params[:reservation_attributes][:id] 
          @workshop.update_reservation(reservation_id) if reservation_id
          puts @workshop
        end  
        
      
        if @workshop.update(workshop_params.except(:reservation_attributes))
          format.html { redirect_to @workshop, notice: 'Workshop was successfully updated.' }
          format.json { render :show, status: :ok, location: @workshop }
        else
          format.html { render :edit }
          format.json { render json: @workshop.errors, status: :unprocessable_entity }
        end
      
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
    params.require(:workshop).permit(:name, :target_public, :agenda, :previous_skills, :price, 
      :length, :max_number_participants, :min_number_participants, :description, :free, reservation_attributes: [:id])
  end
  
  
  
  
end
