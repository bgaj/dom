class SalesController < ApplicationController

  def new
    @sale = Sale.new
  end

  def create
    @sale = Sale.new(sale_params)
    if @sale.save
    else
      render :new
    end
  end

  def destroy

  end

  def sale_params
    params.require(:sale).permit(:sell_at, :price, :total ,:weight, throws_assignment_attributes: [:id, :qty, :throw_id, :_destroy])
  end
end
