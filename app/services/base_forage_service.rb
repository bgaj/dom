class BaseForageService

  def self.save(base_forage, throw)
    total_cost = 0
    total_weight = 0
    base_forage.throw_id = throw.throw
    base_forage.forage_elements.each do |fe|
      fe.weight = ((fe.weight * throw.percent.to_i) / 100).round(2)
      fe.price = (((fe.price * fe.weight / 1000) * throw.percent.to_i) / 100).round(2)
      total_cost += fe.price
      total_weight += fe.weight
    end
    if base_forage.save
      base_forage.throw.update_attributes(eat_weight: (base_forage.throw.eat_weight + total_weight), eat_costs: (base_forage.throw.eat_costs + total_cost) )
    end

  end

  def self.delete(base_forage)
    total_cost = 0
    total_weight = 0
    throw = base_forage.throw
    base_forage.forage_elements.each do |fe|
      total_cost += fe.price
      total_weight += fe.weight
    end
    if base_forage.destroy
      throw.update_attributes(eat_weight: (base_forage.throw.eat_weight - total_weight), eat_costs: (base_forage.throw.eat_costs - total_cost) )
    end
  end
end