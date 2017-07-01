class ThrowsController < ApplicationController

  before_action :set_throw, only: [:show, :edit, :update, :destroy]
  add_breadcrumb "Rzut", :throws_path
  before_action :set_breadcrumb_title

  def set_breadcrumb_title
    @breadcrumb_title="Rzuty"
  end

  def index
    @throws = Throw.where(close: false).order(buy_at: :desc)
    @throws_close = Throw.where(close: true).order(buy_at: :desc)
  end

  def show

  end


  def new
    add_breadcrumb "Nowy"
    @throw = Throw.new
  end


  def edit
    add_breadcrumb "Edytuj"
  end

  # POST /areas
  # POST /areas.json
  def create
    add_breadcrumb "Nowe"
    @throw = Throw.new(throw_params)
    if @throw.save
      redirect_to throws_path, notice: 'Rzut został stworzony'
    else
      render :new
    end
  end

  def update
    add_breadcrumb "Edytuj"
    if @throw.update(throw_params)
      redirect_to throws_path, notice: 'Rzut został zaktualizowany'
    else
      render :edit
    end
  end

  def destroy
    @throw.destroy
    respond_to do |format|
      format.html { redirect_to throws_path, notice: 'Rzut została usunięty' }
    end
  end

  private
  # Use callbacks to share common setup or constraints between throws.
  def set_throw
    @throw = Throw.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def throw_params
    params.require(:throw).permit(:buy_at, :qty, :buy_cost, :weight)
  end

end
