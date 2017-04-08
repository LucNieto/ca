class Cat::SchoolCyclesController < ApplicationController
  before_action :authenticate_user!

  def index
    @school_cycles = SchoolCycle.all
  end

  def new
    @school_cycle = SchoolCycle.new
  end

  def show
  end

  def edit
  end
end
