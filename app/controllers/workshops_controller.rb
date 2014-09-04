class WorkshopsController < ApplicationController
  before_action :set_workshop, only: [:show, :edit, :update, :destroy]
  before_filter :authenticate_expert!, only: [:index, :create, :update, :destroy]
  
  
  # GET /workshops
  # GET /workshops.json
  def index
    if expert_signed_in? 
      @workshops = current_expert.workshops
    end
  end

  # GET /workshops/1
  # GET /workshops/1.json
  def show
  end

  # GET /workshops/new
  def new
    @workshop = Workshop.new
  end

  # GET /workshops/1/edit
  def edit
  end

  # POST /workshops
  # POST /workshops.json
  def create
    @workshop = Workshop.new(workshop_params)
    @workshop.expert=current_expert
    
    respond_to do |format|
      if @workshop.save
        format.html { redirect_to @workshop, notice: I18n.t('views.legends.workshop.proposed_successfully',default: 'Workshop successfully proposed.') }
        format.json { render :show, status: :created, location: @workshop }
      else
        format.html { render root_path }
        format.json { render json: @workshop.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /workshops/1
  # PATCH/PUT /workshops/1.json
  def update
    respond_to do |format|
      if @workshop.update(workshop_params)
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
    params.require(:workshop).permit(:name, :target_public, :agenda, :previous_skills, :price, :length, :max_number_participants, :description)
  end
end
