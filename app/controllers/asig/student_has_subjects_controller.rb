class Asig::StudentHasSubjectsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_student_has_subject, only: [:show, :edit, :update, :destroy]

  def index
    @student_has_subjects = StudentHasSubject.all
  end

  def new
    @student_has_subject = StudentHasSubject.new
  end

  def create
    @student_has_subject = StudentHasSubject.new student_has_subject_params

    respond_to do |format|
      if @student_has_subject.save
        format.html { redirect_to ["asig",@student_has_subject], notice: 'La relacion alumno-materia ha sido creada' }
        format.json { render :show, status: :created, location: @student_has_subject }
      else
        format.html { render :new }
        format.json { render json: @student_has_subject.errors, status: :unprocessable_entity }
      end
    end
  end


  def show
  end

  def edit
  end

  # Get subjects by specific school_cycle
  def get_subjects
    if params[:c].present?
      sc_id = params[:c].to_i
      subjects = Subject.joins(:school_cycle_has_subjects).where("school_cycle_id = ?", sc_id)
      msg = { "success": "true", "subjects": subjects }
    else
      msg = { "success": false, "subjects": 0 }
    end

    render json: msg
  end

  # Get created group by specific school_cycle and subject
  def get_group
    if params[:c].present? && params[:s].present?
      sc_id = params[:c].to_i
      s_id = params[:s].to_i
      group = SchoolCycleHasSubject.where("school_cycle_id = ? AND subject_id = ?", sc_id, s_id).first
      if group.present?
        msg = { "success": "true", "group": group.id }
      else
        msg = { "success": false, "group": nil }
      end
    else
      msg = { "success": false, "group": nil }
    end

    render json: msg
  end

  private
    def set_student_has_subject
      @student_has_subject = StudentHasSubject.find(params[:id])
    end

    def student_has_subject_params
      params.require(:student_has_subject).permit(:school_cycle_has_subject_id, :student_id, :student_type)
    end
end
