class TemplateForagesController < ApplicationController
  before_action :set_template_forage, only: [:edit, :update, :destroy]
  add_breadcrumb "Pasze", :new_base_forage_path
  before_action :set_breadcrumb_title

  def set_breadcrumb_title
    @breadcrumb_title="Pasze"
  end

  def create
    add_breadcrumb "Nowy szablon"
    @template_forage = TemplateForage.new(template_forage_params)
    if @template_forage.save
      flash[:notice] = "Dodano szablon"
      redirect_to new_base_forage_path
    else
      forage_variable
      render 'base_forages/new'
    end
  end

  def edit
    add_breadcrumb "Edycja szablonu"
    forage_variable
    render 'base_forages/new'
  end

  def update
    forage_variable
    add_breadcrumb "Edcyja szablonu"
    if @template_forage.update(template_forage_params)
      @template_forage = TemplateForage.new
      flash[:notice] = "Zaktualizowano szkic"
      redirect_to new_base_forage_path
    else
      render 'base_forages/new'
    end

  end

  def destroy
    if @template_forage.destroy
      flash[:notice] = "Szkic został usunięty"
      redirect_to new_base_forage_path
    end
  end

  private

  def forage_variable
    @base_forage = BaseForage.new
    @temp_throw = TempThrow.new
  end

  def template_forage_params
    params.require(:template_forage).permit(:template_name, forage_elements_attributes: [:id, :kind, :weight, :price, :_destroy])
  end

  def set_template_forage
    @template_forage = TemplateForage.find(params[:id])
  end
end
