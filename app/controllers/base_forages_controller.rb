class BaseForagesController < ApplicationController
  add_breadcrumb "Pasze", :new_base_forage_path
  before_action :set_breadcrumb_title

  def set_breadcrumb_title
    @breadcrumb_title="Pasze"
  end

  def new
    add_breadcrumb "Nowa pasza"
    @base_forage = BaseForage.new
    @template_forage = TemplateForage.new
    @temp_throw = TempThrow.new
  end

  def create
    add_breadcrumb "Nowa pasza"
    @template_forage = TemplateForage.new
    @temp_throws = []
    temp_throws_statuses = []
    if params[:temp_throw]
      params[:temp_throw].each do |throw|
        temp_throw = TempThrow.new(throw: throw[:throw], percent: throw[:percent])
        @temp_throws.push(temp_throw)
        temp_throws_statuses.push(temp_throw.validate)
      end
    end
    if @temp_throws.empty? || !temp_throws_statuses.all?
      @base_forage = BaseForage.new(base_forage_params)
      @base_forage.validate
      render :new
      return false
    end

    @base_forage = BaseForage.new(base_forage_params)
    if @base_forage.validate
      @temp_throws.each do |throw|
        BaseForageService.save(@base_forage, throw)
      end
      flash[:notice] = "Dodano pasze"
      redirect_to new_base_forage_path
    else
      render :new
    end
  end

  def load_temp_throw
    @temp_throw = TempThrow.new
  end

  def load_template
    add_breadcrumb "Nowa pasza"
    template = TemplateForage.find(params[:temp_id])
    @base_forage = BaseForage.new
    template.forage_elements.each do |fe|
      @base_forage.forage_elements.build(kind: fe.kind, weight: fe.weight, price: fe.price)
    end
    @template_forage = TemplateForage.new
    @temp_throw = TempThrow.new
    render :new
  end

  private

  def base_forage_params
    params.require(:base_forage).permit(:made_at, forage_elements_attributes: [:id, :kind, :weight, :price, :_destroy])
  end

end
