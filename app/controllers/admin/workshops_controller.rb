class Admin::WorkshopsController < Admin::AdminController
  before_action :set_workshop, only: [:show, :edit, :update, :destroy, :state]

  def state
    puts "Workshop: #{@workshop.state} - #{@workshop.state_events} - #{@workshop.state_transitions}"
    changed=@workshop.has_been_given
    
    respond_to do |format|
        if changed
          format.html { redirect_to [:admin, @workshop], notice: "Workshop's state was successfully updated." }
          format.json { head :no_content }
        else
          format.html { redirect_to [:admin, @workshop], alert: "Workshop's state was not updated." }
          format.json { render json: @workshop.errors, status: :unprocessable_entity }
        end
    end
  end


  # GET /admin/workshops
  # GET /admin/workshops.json
  def index
    @workshops = Workshop.all.order('proposed_date desc nulls last').page params[:page]
  end
  
  
  def proposed
    @workshops = Workshop.proposed.order('proposed_date desc nulls last').page params[:page]
  end

  def scheduled
    @workshops = Workshop.scheduled.next_scheduled.order('starts_at').page params[:page]
  end
  
  def scheduled_past
    @workshops = Workshop.scheduled.past_scheduled.order('starts_at desc').page params[:page]
  end
  
  def scheduled
    @workshops = Workshop.scheduled.order('proposed_date desc nulls last').page params[:page]
  end
  
  def given
    @workshops = Workshop.given.order('proposed_date desc nulls last').page params[:page]
  end


  # GET /admin/workshops/1
  # GET /admin/workshops/1.json
  def show
  end

  # GET /admin/workshops/new
  def new
    @workshop = Workshop.new
  end

  # GET /admin/workshops/1/edit
  def edit
  end

  # POST /admin/workshops
  # POST /admin/workshops.json
  def create
    @workshop = Workshop.new(workshop_params)

    respond_to do |format|
      if @workshop.save
        format.html { redirect_to [:admin, @workshop], notice: 'Workshop was successfully created.' }
        format.json { render action: 'show', status: :created, location: @workshop }
      else
        format.html { render action: 'new' }
        format.json { render json: @workshop.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /admin/workshops/1
  # PATCH/PUT /admin/workshops/1.json
  def update
    respond_to do |format|
      if @workshop.update(workshop_params)
        format.html { redirect_to [:admin, @workshop], notice: 'Workshop was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @workshop.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /admin/workshops/1
  # DELETE /admin/workshops/1.json
  def destroy
    @workshop.destroy
    respond_to do |format|
      format.html { redirect_to admin_workshops_url, notice: 'Workshop was successfully destroyed.' }
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
      params.require(:workshop).permit(:name, :free, :state, :proposed_date, :zone_id)
    end
end
