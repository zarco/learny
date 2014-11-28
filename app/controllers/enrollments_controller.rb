class EnrollmentsController < ApplicationController
  before_action :set_enrollment, only: [:show, :edit, :destroy]

  respond_to :html

  def index
    if student_signed_in?
      @enrollments = Enrollment.where(:student => current_student)
    end
  end

  def show
    respond_with(@enrollment)
  end

  def new
    @enrollment = Enrollment.new
    respond_with(@enrollment)
  end

  def edit
  end

  def create
    @enrollment = Enrollment.new(enrollment_params)
    respond_to do |format|
      if @enrollment.save
        format.html { redirect_to workshop_path( @enrollment.workshop), :notice => I18n.t('controllers.enrollments.create', default: 'Student successfully enrolled') }
        #format.html { redirect_to root_path, :notice => 'Student successfully enrolled' }
        format.json { render :show, status: :created, location: @workshop }
      else
        format.html { render :new}
        format.json { render json: @enrollment.errors, status: :unprocessable_entity }
      end
    end   
  end

  def destroy
    @enrollment.destroy
    respond_with(@enrollment)
  end

  private
    def set_enrollment
      @enrollment = Enrollment.find(params[:id])
    end

    def enrollment_params
      params.require(:enrollment).permit(:workshop_id, :student_id)
    end
end
