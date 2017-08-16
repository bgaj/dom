class SaleService

  def self.calculate(sale)
    if sale.calculate == "1"
      sale.total_netto = sale.weight * sale.price
      sale.vat = sale.total_netto * 0.08
      sale.total = sale.total_netto + sale.vat
    end
    sale
  end

end