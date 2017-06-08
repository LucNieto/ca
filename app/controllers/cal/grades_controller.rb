class Cal::GradesController < ApplicationController
  before_action :set_grade, only: [:show, :edit, :update, :destroy]

  # GET /grades
  # GET /grades.json
  def index
    @grades = Grade.all

    respond_to do |format|
      format.html
      format.csv { send_data @grades.to_csv }
      format.xls { send_data @grades.to_csv(col_sep: "\t") }
      format.pdf { render pdf: generate_pdf(@grades) }
    end

  end

  # GET /grades/1
  # GET /grades/1.json
  def show
  end

  # GET /grades/new
  def new
    @grade = Grade.new
  end

  # GET /grades/1/edit
  def edit
  end

  # POST /grades
  # POST /grades.json
  def create
    @grade = Grade.new(grade_params)

    respond_to do |format|
      if @grade.save
        format.html { redirect_to ["cal",@grade], notice: 'Grade was successfully created.' }
        format.json { render :show, status: :created, location: @grade }
      else
        format.html { render :new }
        format.json { render json: @grade.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /grades/1
  # PATCH/PUT /grades/1.json
  def update
    respond_to do |format|
      if @grade.update(grade_params)
        format.html { redirect_to ["cal",@grade], notice: 'Grade was successfully updated.' }
        format.json { render :show, status: :ok, location: @grade }
      else
        format.html { render :edit }
        format.json { render json: @grade.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /grades/1
  # DELETE /grades/1.json
  def destroy
    @grade.destroy
    respond_to do |format|
      format.html { redirect_to cal_grades_path, notice: 'La calificación ha sido eliminada' }
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
    def set_grade
      @grade = Grade.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def grade_params
      params.require(:grade).permit(:student_has_subject_id, :aplicar_parcial, :grade_type, :calificacion)
    end
end
