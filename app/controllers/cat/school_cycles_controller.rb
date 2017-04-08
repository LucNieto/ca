class Cat::SchoolCyclesController < ApplicationController
  before_action :authenticate_user!

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
        format.html { redirect_to [ "cat", @school_cycle ], notice: 'El ciclo ha sido creado' }
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

  private
    def school_cycle_params
      params.require(:school_cycle).permit(:career_id, :nombre_ciclo)
    end
end
