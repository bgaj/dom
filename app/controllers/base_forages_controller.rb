class BaseForagesController < ApplicationController

  def new
    @base_forage = BaseForage.new
  end

  def create
    raise
    @base_forage = BaseForage.new(base_forage_params)
    if @base_forage.save
    else
      render :new
    end
  end
  def edit
    @base_forage = BaseForage.find(params[:id])
  end

  def update
    @base_forage = BaseForage.find(params[:id])
    if @base_forage.update(base_forage_params)
      raise
    else
      render :edit
    end
  end
  def base_forage_params
    params.require(:base_forage).permit(:sell_at, :price, :total ,:weight, throws_assignment_attributes: [:id, :qty, :throw_id, :_destroy])
  end
end
