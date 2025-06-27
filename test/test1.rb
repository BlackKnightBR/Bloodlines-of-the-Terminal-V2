class Potion
  attr_accessor :cure

  def initialize
    @cure = 30
  end

  def apply(player)
    player.hp= player.hp + @cure
  end
end

class Short_Sword
  attr_accessor :attack

  def initialize
    @attack = 10
  end

  def equip(player)
    player.attack= player.attack + @attack
  end
end


class Hero 
  attr_accessor :hp, :attack
  def initialize
    @hp = 100
    @attack = 50
  end
end

garen = Hero.new
potion = Potion.new
sword = Short_Sword.new

puts "HP: #{garen.hp}"
potion.apply(garen)
puts "HP: #{garen.hp}"
puts "Attack: #{garen.attack}"
sword.equip(garen)
puts "Attack: #{garen.attack}"



