class CropsController < ApplicationController
  before_action :set_crop, only: [:show, :edit, :update, :destroy]

  # GET /areas
  # GET /areas.json
  def index
    @crops = Crop.all
  end

  # GET /areas/1
  # GET /areas/1.json
  def show

  end

  # GET /areas/new

  def new
    @crop = Crop.new
  end
  # GET /areas/1/edit
  def edit
  end

  # POST /areas
  # POST /areas.json
  def create
    @crop = Crop.new(crop_params)
    if @crop.save
      redirect_to crops_path, notice: 'Crop was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /areas/1
  # PATCH/PUT /areas/1.json
  def update
    if @crop.update(crop_params)
      redirect_to crops_path, notice: 'Crop was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /areas/1
  # DELETE /areas/1.json
  def destroy
    @crop.destroy
    respond_to do |format|
      format.html { redirect_to crops_path, notice: 'Crop was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
  # Use callbacks to share common setup or constraints between crops.
  def set_crop
    @crop = Crop.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def crop_params
    params.require(:crop).permit(:kind, :sown_at, :harvest_at, :crop, :variant, :area_id)
  end
end
