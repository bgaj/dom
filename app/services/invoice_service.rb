class InvoiceService

  def self.set_pay_time(invoice)
    if invoice.pay_date.nil? && invoice.pay_time && invoice.made_at
      invoice.made_at  + invoice.pay_time.to_i.days
    end
  end

end