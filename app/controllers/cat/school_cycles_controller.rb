class Cat::SchoolCyclesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_school_cycle, only:[ :show, :edit, :update, :destroy ]

  def index
    @school_cycles = SchoolCycle.all
  end

  def new
    @school_cycle = SchoolCycle.new
  end

  def create
    @school_cycle = SchoolCycle.new(school_cycle_params)

    respond_to do |format|
      if @school_cycle.save
        format.html { redirect_to [ "cat", @school_cycle ], notice: 'El ciclo escolar ha sido creado' }
        format.json { render :show, status: :created, location: @school_cycle }
      else
        format.html { render :new }
        format.json { render json: @school_cycle.errors, status: :unprocessable_entity }
      end
    end
  end

  def show
  end

  def edit
  end

  def update
    respond_to do |format|
      if @school_cycle.update(school_cycle_params)
        format.html { redirect_to [ "cat", @school_cycle ], notice: 'El ciclo escolar ha sido actualizado' }
        format.json { render :show, status: :ok, location: @school_cycle }
      else
        format.html { render :edit }
        foramt.json { render json: @school_cycle.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @school_cycle.destroy
    respond_to do |format|
      format.html { redirect_to cat_school_cycles_path, notice: 'El ciclo escolar ha sido eliminado' }
      format.json { head :no_content }
    end
  end

  private
    def set_school_cycle
      @school_cycle = SchoolCycle.find params[:id]
    end

    def school_cycle_params
      params.require(:school_cycle).permit(:career_id, :nombre_ciclo)
    end
end
