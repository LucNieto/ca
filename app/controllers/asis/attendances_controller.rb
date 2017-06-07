class Asis::AttendancesController < ApplicationController
before_action :authenticate_user!
before_action :set_attendance, only: [:show, :edit, :update, :destroy]

  # GET /attendances
  # GET /attendances.json
  def index
    @attendances = Attendance.all
  end

  # GET /attendances/1
  # GET /attendances/1.json
  def show
  end

  # GET /attendances/new
  def new
    @attendance = Attendance.new
  end

  # GET /attendances/1/edit
  def edit
  end

  # POST /attendances
  # POST /attendances.json
  def create
    @attendance = Attendance.new(attendance_params)


    respond_to do |format|
        #binding.pry
      if @attendance.save
        format.html { redirect_to ["asis",@attendance], notice: 'La asistenca ha sido registrada.' }
        format.json { render :show, status: :created, location: @attendance }
      else
        format.html { render :new }
        format.json { render json: @attendance.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /attendances/1
  # PATCH/PUT /attendances/1.json
  def update
    respond_to do |format|
      if @attendance.update(attendance_params)
        format.html { redirect_to ["asis",@attendance], notice: 'La asistenca ha sido actualizada.' }
        format.json { render :show, status: :ok, location: @attendance }
      else
        format.html { render :edit }
        format.json { render json: @attendance.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /attendances/1
  # DELETE /attendances/1.json
  def destroy
    @attendance.destroy
    respond_to do |format|
      format.html { redirect_to asis_attendances_path, notice: 'La asistenca ha sido eliminada.' }
      format.json { head :no_content }
    end
  end


  # Get subjects by specific student
def get_subjects
  if params[:s].present?
    s_id = params[:s].to_i
    subjects_by_student = Subject.joins("INNER JOIN school_cycle_has_subjects ON subjects.id = school_cycle_has_subjects.subject_id INNER JOIN student_has_subjects ON school_cycle_has_subjects.id = student_has_subjects.school_cycle_has_subject_id").where("student_id = ?", s_id)
    msg = { "success": "true", "subjects": subjects_by_student }
  else
    msg = { "success": false, "subjects": 0 }
  end

  render json: msg
end

  # Get created group by specific student and subject
def get_group
  if params[:stu].present? && params[:sub].present?
    student_id = params[:stu].to_i
    subject_id = params[:sub].to_i
    student_subject = StudentHasSubject.joins(:school_cycle_has_subject).where("student_id = ? AND subject_id = ?", student_id, subject_id).first
    if student_subject.present?
      msg = { "success": "true", "student_subject": student_subject.id }
    else
      msg = { "success": false, "student_subject": nil }
    end
  else
    msg = { "success": false, "student_subject": nil }
  end

  render json: msg
end


  private
    # Use callbacks to share common setup or constraints between actions.
    def set_attendance
      @attendance = Attendance.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def attendance_params
      params.require(:attendance).permit(:student_has_subject_id, :attendance_type, :fecha_asistencia)
    end
end
