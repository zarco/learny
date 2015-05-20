class WorkshopsController < ApplicationController
  before_action :set_workshop, only: [:show, :edit, :update, :destroy]
  before_filter :authenticate_expert!, only: [:create, :update, :destroy]
  
  # GET /workshops
  # GET /workshops.json
  def index
    w=params[:w]
    if !w.nil?
      @guest = Guest.new
      @workshop_solicited = w
      w = Workshop.select(:name).limit(1).order("random()").first.name if w.strip.empty?      
      workshops_scheduled = Workshop.search_workshop(w).joins(:reservation).where("starts_at >= ?", DateTime.now)
      workshops_proposed = Workshop.search_workshop(w).where("state = ? ",'proposed')
      @workshops = workshops_scheduled + workshops_proposed
      @old_workshops = Workshop.search_workshop(w).joins(:reservation).where("starts_at < ?", DateTime.now)
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
      @workshop = Workshop.create(workshop_params.except(:reservation_attributes)
        .merge({:expert => current_expert}))
      @workshop.proposed_by_expert
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
      updated=false
      Workshop.transaction do       
        unless workshop_params[:reservation_attributes].nil?
          reservation_id=workshop_params[:reservation_attributes][:id] 
          @workshop.update_reservation(reservation_id) if reservation_id
        end
        #puts @workshop.errors.full_messages if @workshop.invalid?
        raise ActiveRecord::Rollback if @workshop.invalid?
        updated=@workshop.update(workshop_params.except(:reservation_attributes))   
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

  def all
    @workshops = Workshop.paginate(:page => params[:page], :per_page => 10)
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_workshop
    @workshop = Workshop.find(params[:id])
    @reservation = @workshop.reservation.nil? ? Reservation.new : @workshop.reservation
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def workshop_params
    params.require(:workshop).permit(:name, :target_public, :agenda, :previous_skills, :price, 
      :length, :max_number_participants, :min_number_participants, :description, :free, :proposed_date, :zone_id, reservation_attributes: [:id])
  end
  
  
  
  
end
