class StudentSurveysController < ApplicationController
  
  before_action :set_workshop, only: [:new, :create]
  before_action :set_student_survey, only: [:show, :edit, :update, :destroy]
  

  # GET /student_surveys
  # GET /student_surveys.json
  def index
    @student_surveys = StudentSurvey.all
  end

  # GET /student_surveys/1
  # GET /student_surveys/1.json
  def show
  end

  # GET /student_surveys/new
  def new
    @student_survey = StudentSurvey.new(workshop: @workshop)
  end

  # GET /student_surveys/1/edit
  def edit
  end

  # POST /student_surveys
  # POST /student_surveys.json
  def create
    @student_survey = StudentSurvey.new(
      student_survey_params.merge({workshop: @workshop, student: current_student}))

    respond_to do |format|
      if @student_survey.save
        format.html { redirect_to @student_survey, notice: I18n.t('controllers.students_survey.create',default: 'Student survey was successfully created.') }
        format.json { render :show, status: :created, location: @student_survey }
      else
        format.html { render :new }
        format.json { render json: @student_survey.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /student_surveys/1
  # PATCH/PUT /student_surveys/1.json
  def update
    respond_to do |format|
      if @student_survey.update(student_survey_params)
        format.html { redirect_to @student_survey, notice: 'Student survey was successfully updated.' }
        format.json { render :show, status: :ok, location: @student_survey }
      else
        format.html { render :edit }
        format.json { render json: @student_survey.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /student_surveys/1
  # DELETE /student_surveys/1.json
  def destroy
    @student_survey.destroy
    respond_to do |format|
      format.html { redirect_to student_surveys_url, notice: 'Student survey was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_student_survey
      @student_survey = StudentSurvey.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def student_survey_params
      params.require(:student_survey).permit(:rating_workshop, :rating_expert, 
        :rating_venue, :rating_learny, :workshop_comment, :venue_comment)
    end
    
    def set_workshop
      @workshop = Workshop.find(params[:workshop_id])
    end
end
