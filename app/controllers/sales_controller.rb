class SalesController < ApplicationController

  def new
    @sale = Sale.new
  end

  def create
    @sale = Sale.new(sale_params)
    if @sale.save
      raise
    else
      render :new
    end
  end
  def edit
    @sale = Sale.find(params[:id])
  end

  def update
    @sale = Sale.find(params[:id])
    if @sale.update(sale_params)
      raise
    else
      render :edit
    end
  end
  def sale_params
    params.require(:sale).permit(:sell_at, :price, :total ,:weight, throws_assignment_attributes: [:id, :qty, :throw_id, :_destroy])
  end
end
