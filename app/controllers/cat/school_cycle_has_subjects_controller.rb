class Cat::SchoolCycleHasSubjectsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_school_cycle_has_subject, only: [:show, :edit, :update, :destroy]

  # GET /school_cycle_has_subjects
  # GET /school_cycle_has_subjects.json
  def index
    @school_cycle_has_subjects = SchoolCycleHasSubject.all
  end

  # GET /school_cycle_has_subjects/1
  # GET /school_cycle_has_subjects/1.json
  def show
  end

  # GET /school_cycle_has_subjects/new
  def new
    @school_cycle_has_subject = SchoolCycleHasSubject.new
  end

  # GET /school_cycle_has_subjects/1/edit
  def edit
  end

  # POST /school_cycle_has_subjects
  # POST /school_cycle_has_subjects.json
  def create
    @school_cycle_has_subject = SchoolCycleHasSubject.new(school_cycle_has_subject_params)

    respond_to do |format|
      if @school_cycle_has_subject.save
        format.html { redirect_to ["cat",@school_cycle_has_subject], notice: 'La relacion maestro-grupo ha sido creada' }
        format.json { render :show, status: :created, location: @school_cycle_has_subject }
      else
        format.html { render :new }
        format.json { render json: @school_cycle_has_subject.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /school_cycle_has_subjects/1
  # PATCH/PUT /school_cycle_has_subjects/1.json
  def update
    respond_to do |format|
      if @school_cycle_has_subject.update(school_cycle_has_subject_params)
        format.html { redirect_to ["cat",@school_cycle_has_subject], notice: 'School cycle has subject was successfully updated.' }
        format.json { render :show, status: :ok, location: @school_cycle_has_subject }
      else
        format.html { render :edit }
        format.json { render json: @school_cycle_has_subject.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /school_cycle_has_subjects/1
  # DELETE /school_cycle_has_subjects/1.json
  def destroy
    @school_cycle_has_subject.destroy
    respond_to do |format|
      format.html { redirect_to cat_school_cycle_has_subjects_path, notice: 'School cycle has subject was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_school_cycle_has_subject
      @school_cycle_has_subject = SchoolCycleHasSubject.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def school_cycle_has_subject_params
      params.require(:school_cycle_has_subject).permit(:school_cycle_id, :teacher_id, :subject_id, :lunes, :martes, :miercoles, :jueves, :viernes, :sabado, :horario_clases)
    end
end
