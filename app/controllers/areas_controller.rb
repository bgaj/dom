class AreasController < ApplicationController
  before_action :set_area, only: [:show, :edit, :update, :destroy]
  before_action :set_area_nested, only: [:show_modal, :coords]

  # GET /areas
  # GET /areas.json
  def index
    @areas = Area.all
  end

  # GET /areas/1
  # GET /areas/1.json
  def show

  end

  # GET /areas/new
  def coords
    @area.coordinates.destroy_all
    hash = JSON.parse params[:coords]
    hash.each do |p|
      @area.coordinates.create(coordinate: p)
    end
    respond_to do |format|
      format.js { render :coords, locales: { data: params[:data] } }
    end
  end

  def show_modal
    respond_to do |format|
      format.js { render "modal", locals: { change: params[:change] }}
    end
  end

  def new
    @area = Area.new
  end
  # GET /areas/1/edit
  def edit
  end

  # POST /areas
  # POST /areas.json
  def create
    @area = Area.new(area_params)
    if @area.save
      redirect_to areas_path, notice: 'Area was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /areas/1
  # PATCH/PUT /areas/1.json
  def update
    if @area.update(area_params)
      redirect_to areas_path, notice: 'Area was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /areas/1
  # DELETE /areas/1.json
  def destroy
    @area.destroy
    respond_to do |format|
      format.html { redirect_to areas_url, notice: 'Area was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_area
      @area = Area.find(params[:id])
    end

    def set_area_nested
      @area = Area.find(params[:area_id])
    end
    # Never trust parameters from the scary internet, only allow the white list through.
    def area_params
      params.require(:area).permit(:name, :area, :area_class_id)
    end
end
