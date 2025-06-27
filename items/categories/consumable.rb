class Consumable < Item
  attr_reader :effect_value

  def initialize(name, effect_value)
    super(name)
    @effect_value = effect_value
  end
end

class Potion < Consumable
  def use(player)
    player.hp += @effect_value
    puts "#{player.name} consumes #{@name} and restores #{@effect_value} HP!"
  end
end

class Food < Consumable
  def use(player)
    player.hp += @effect_value
    player.defense += @effect_value
    puts "#{player.name} consumes #{@name} and restores #{@effect_value} HP!"
    puts "#{player.name} consumes #{@name} and gains #{@effect_value} Defense!"
  end
end

class Esteroid < Consumable
  def use(player)
    player.attack += @effect_value
    puts "#{player.name} consumes #{@name} and gains #{@effect_value} Attack!"
  end
end
