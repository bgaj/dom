class BaseForagesController < ApplicationController

  def new
    @base_forage = BaseForage.new
    @temp_throw = TempThrow.new
  end

  def create
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
      flash[:success] = "Dodano pasze"
      redirect_to new_base_forage_path
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

  def load_temp_throw
    @temp_throw = TempThrow.new
  end

  private

  def base_forage_params
    params.require(:base_forage).permit(:made_at, forage_elements_attributes: [:id, :kind, :weight, :price, :_destroy])
  end
end
