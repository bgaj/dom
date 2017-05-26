class EventsController < ApplicationController
  before_action :set_event, only: [:show, :edit, :update, :destroy]
  add_breadcrumb "Zdarzenia", :events_path
  before_action :set_breadcrumb_title
  def set_breadcrumb_title
    @breadcrumb_title="Zdarzenia"
  end
  # GET /areas
  # GET /areas.json
  def index
    @events = Event.all
  end

  # GET /areas/1
  # GET /areas/1.json
  def show

  end

  # GET /areas/new

  def new
    add_breadcrumb "Nowe"
    @event = Event.new
  end
  # GET /areas/1/edit
  def edit
    add_breadcrumb "Edycja"
  end

  # POST /areas
  # POST /areas.json
  def create
    add_breadcrumb "Nowe"
    @event = Event.new(event_params)
    if @event.save
      redirect_to events_path, notice: 'Action was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /areas/1
  # PATCH/PUT /areas/1.json
  def update
    add_breadcrumb "Edycja"
    if @event.update(event_params)
      redirect_to events_path, notice: 'Action was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /areas/1
  # DELETE /areas/1.json
  def destroy
    @event.destroy
    respond_to do |format|
      format.html { redirect_to events_path, notice: 'Action was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between events.
    def set_event
      @event = Event.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def event_params
      params.require(:event).permit(:event, :made_at, :description, :cost, :area_ids => [])
    end
end
