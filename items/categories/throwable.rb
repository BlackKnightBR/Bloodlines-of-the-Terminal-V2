class Throwable < Item
  attr_reader :damage

  def initialize(name, damage)
    super(name)
    @damage = damage
  end

end

class Knife < Throwable
  def use(enemy)
    enemy.take_damage(@damage)
    puts "#{enemy.name} is hit by #{@name} and takes #{@damage} damage!"
  end
end

class Acid < Throwable
  def use(enemy)
    enemy.defense -= damage
    puts "#{enemy.name} is corroded by #{@name}, losing #{@damage} Defense!"
  end
end

class Booze < Throwable
  def use(enemy)
    enemy.attack -= damage
    puts "#{enemy.name} is weakened by #{@name}, losing #{@damage} Attack!"
  end
end




