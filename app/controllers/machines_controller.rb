class MachinesController < ApplicationController
  before_action :set_machine, only: [:show, :edit, :update, :destroy]
  add_breadcrumb "Maszyny", :areas_path
  before_action :set_breadcrumb_title



  def index
    @machines = Machine.all
  end

  # GET /machines/1
  # GET /machines/1.json
  def show
  end

  # GET /machines/new
  def new
    add_breadcrumb "Nowa"
    @machine = Machine.new
  end

  # GET /machines/1/edit
  def edit
    add_breadcrumb "Edycja"
  end

  # POST /machines
  # POST /machines.json
  def create
    add_breadcrumb "Nowa"
    @machine = Machine.new(machine_params)
    if @machine.save
      redirect_to machines_path, notice: 'Maszyna została dodana.'
    else
      render :new
    end
  end

  # PATCH/PUT /machines/1
  # PATCH/PUT /machines/1.json
  def update
    add_breadcrumb "Edycja"
    if @machine.update(machine_params)
      redirect_to machines_path, notice: 'Maszyna została zaktualizowana.'
    else
      render :edit
    end
  end

  # DELETE /machines/1
  # DELETE /machines/1.json
  def destroy
    @machine.destroy
    respond_to do |format|
      format.html { redirect_to machines_url, notice: 'Maszyna została usunieta.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_machine
      @machine = Machine.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def machine_params
      params.require(:machine).permit(:name, :made_at, :description, :buy)
    end

    def set_breadcrumb_title
      @breadcrumb_title="Maszyny"
    end
end
