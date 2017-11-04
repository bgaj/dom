class InvoicesController < ApplicationController
  before_action :set_invoice, only: [:show, :edit, :update, :destroy]
  add_breadcrumb "Faktury", :events_path
  before_action :set_breadcrumb_title
  def set_breadcrumb_title
    @breadcrumb_title="Faktury"
  end

  def index
    @invoices = Invoice.all.order(made_at: :desc)
  end

  def show

  end

  def new
    add_breadcrumb "Nowa"
    @invoice = Invoice.new
  end

  def edit
    add_breadcrumb "Edycja"
  end

  def create
    add_breadcrumb "Nowa"
    @invoice = Invoice.new(invoice_params)
    if @invoice.save
      redirect_to invoice_path, notice: 'Faktura została dodana.'
    else
      render :new
    end
  end

  def update
    add_breadcrumb "Edycja"
    if @invoice.update(invoice_params)
      redirect_to invoice_path, notice: 'Faktura została zapisana.'
    else
      render :edit
    end
  end

  def destroy
    @invoice.destroy
    respond_to do |format|
      format.html { redirect_to events_path, notice: 'Faktura została usunięta' }
    end
  end

  private
  def set_event
    @invoice = Invoice.find(params[:id])
  end

  def invoice_params
    params.require(:invoice).permit(:number, :made_at, :pay_date, :recived_at, :name, :city, :post, :nip, :scan, :status, invoice_elements_attributes: [:id, :netto, :vat, :price, :_destroy])
  end
end
