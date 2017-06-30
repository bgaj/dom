class BaseForageService

  def self.save(base_forage, throw)
    base_forage.throw_id = throw.throw
    base_forage.forage_elements.each do |fe|
      fe.weight = ((fe.price * throw.percent.to_i) / 100).round(2)
      fe.price = (((fe.price * fe.weight / 1000) * throw.percent.to_i) / 100).round(2)
    end
    base_forage.save
  end

end