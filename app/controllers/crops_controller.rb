class CropsController < ApplicationController
  before_action :set_crop, only: [:show, :edit, :update, :destroy]
  add_breadcrumb "Uprawy", :crops_path
  before_action :set_breadcrumb_title

  def set_breadcrumb_title
    @breadcrumb_title="Uprawy"
  end
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
    add_breadcrumb "Nowe"
    @crop = Crop.new
  end

  def new_many
    add_breadcrumb "Nowe"
    if params[:area_ids]
      @crop = Crop.new(areas: params[:area_ids])
      @crop.areas.unshift("")
    else
      @crop = Crop.new
    end
  end

  def create_with_areas
    add_breadcrumb "Nowe"
    @crop = Crop.new(areas: params[:area_ids] || [])
    @crop.areas.unshift("")
    render 'new_many'
  end
  # GET /areas/1/edit
  def edit
    add_breadcrumb "Edytuj"
  end

  # POST /areas
  # POST /areas.json
  def create
    add_breadcrumb "Nowe"
    @crop = Crop.new(crop_params)
    if @crop.save
      redirect_to crops_path, notice: 'Uprawa została dodana do pola'
    else
      render :new
    end
  end

  def create_many

    add_breadcrumb "Nowe"
    params[:crop][:areas].reject{|i| i.blank?}.each do |id|
      params[:crop][:area_id]=id
      @crop = Crop.new(crop_params)
      if @crop.save
      else
        @crop.areas=params[:crop][:areas]
        render :new_many
        return false
      end
    end
    redirect_to crops_path, notice: 'Uprawy zostały dodane do pól'
  end

  # PATCH/PUT /areas/1
  # PATCH/PUT /areas/1.json
  def update
    add_breadcrumb "Edytuj"
    if @crop.update(crop_params)
      redirect_to crops_path, notice: 'Uprawa została zaktualizowana'
    else
      render :edit
    end
  end

  # DELETE /areas/1
  # DELETE /areas/1.json
  def destroy
    @crop.destroy
    respond_to do |format|
      format.html { redirect_to crops_path, notice: 'Uprawa została usunięta' }
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
