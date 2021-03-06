class ThrowsController < ApplicationController

  before_action :set_throw, only: [:show, :edit, :update, :destroy]
  add_breadcrumb "Rzuty", :throws_path
  before_action :set_breadcrumb_title

  def set_breadcrumb_title
    @breadcrumb_title="Rzuty"
  end

  def index
    @throws = Throw.where(close: false).order(buy_at: :desc)
    @throws_close = Throw.where(close: true).order(buy_at: :desc)
  end

  def show
    add_breadcrumb @throw.number
    kinds = @throw.base_forages.joins(:forage_elements).select('distinct forage_elements.kind').map{|c| c.kind}
    @kinds = ForageElement.kinds.collect{|c| c[0] if kinds.member?(c[1])}.compact
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
    if @throw.sales.empty?
      @throw.destroy
      redirect_to throws_path, notice: 'Rzut została usunięty'
    else
      flash[:error] = "Rzut posiada dodane faktury i nie może zostać usunięty"
      redirect_to throws_path
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
