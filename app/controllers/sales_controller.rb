class SalesController < ApplicationController

  add_breadcrumb "Sprzedaż", :sales_path
  before_action :set_breadcrumb_title

  def set_breadcrumb_title
    @breadcrumb_title="Sprzedaż"
  end

  def index
    @sales = Sale.all.order(number: :desc)
  end

  def new
    add_breadcrumb "Nowa faktura"
    @sale = Sale.new
  end

  def create
    add_breadcrumb "Nowa faktura"
    @sale = Sale.new(sale_params)
    if @sale.save
    else
      render :new
    end
  end

  def destroy
    @sale = Sale.find(params[:id])
    if @sale.destroy
      flash[:notice] = "Faktura została usunięta"
    else
      flash[:error] = "Wystąpił błąd"
    end
    redirect_to sales_path
  end

  def sale_params
    params.require(:sale).permit(:sell_at, :price, :total ,:weight, throws_assignment_attributes: [:id, :qty, :throw_id, :_destroy])
  end
end
