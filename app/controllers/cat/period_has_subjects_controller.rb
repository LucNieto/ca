class Cat::PeriodHasSubjectsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_period_has_subject, only: [:show, :edit, :update, :destroy]

  # GET /period_has_subjects
  # GET /period_has_subjects.json
  def index
    @period_has_subjects = PeriodHasSubject.all
  end

  # GET /period_has_subjects/1
  # GET /period_has_subjects/1.json
  def show
  end

  # GET /period_has_subjects/new
  def new
    @period_has_subject = PeriodHasSubject.new
  end

  # GET /period_has_subjects/1/edit
  def edit
  end

  # POST /period_has_subjects
  # POST /period_has_subjects.json
  def create
    @period_has_subject = PeriodHasSubject.new(period_has_subject_params)

    respond_to do |format|
      if @period_has_subject.save
        format.html { redirect_to ["cat",@period_has_subject], notice: 'Period has subject was successfully created.' }
        format.json { render :show, status: :created, location: @period_has_subject }
      else
        format.html { render :new }
        format.json { render json: @period_has_subject.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /period_has_subjects/1
  # PATCH/PUT /period_has_subjects/1.json
  def update
    respond_to do |format|
      if @period_has_subject.update(period_has_subject_params)
        format.html { redirect_to ["cat",@period_has_subject], notice: 'Period has subject was successfully updated.' }
        format.json { render :show, status: :ok, location: @period_has_subject }
      else
        format.html { render :edit }
        format.json { render json: @period_has_subject.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /period_has_subjects/1
  # DELETE /period_has_subjects/1.json
  def destroy
    @period_has_subject.destroy
    respond_to do |format|
      format.html { redirect_to cat_period_has_subjects_path, notice: 'Period has subject was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_period_has_subject
      @period_has_subject = PeriodHasSubject.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def period_has_subject_params
      params.require(:period_has_subject).permit(:period_id, :teacher_id, :subject_id, :lunes, :martes, :miercoles, :jueves, :viernes, :sabado, :horario_clases)
    end
end
