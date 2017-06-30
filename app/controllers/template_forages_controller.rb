class TemplateForagesController < ApplicationController

  def create
    @template_forage = TemplateForage.new(template_forage_params)
    if @template_forage.save
      flash[:success] = "Dodano szablon"
      redirect_to new_base_forage_path
    else
      @base_forage = BaseForage.new
      @temp_throw = TempThrow.new
      render 'base_forages/new'
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

  private

  def template_forage_params
    params.require(:template_forage).permit(:template_name, forage_elements_attributes: [:id, :kind, :weight, :price, :_destroy])
  end
end
