class Equipable < Item
  attr_reader :value

  def initialize(name, value)
    super(name)
    @value = value
  end
end

class Weapon < Equipable
  def initialize (name, value)
    super(name, value)
  end

  def use (player)
    player.attack += @value
    puts "#{player.name} equips #{@name} and gains +#{@value} of attack!"
  end
end

class Armor < Equipable
  def initialize(name, value)
    super(name, value)
  end

  def use (player)
    player.defense += @value
    puts "#{player.name} equips #{@name} and gains +#{@value} of defense!"
  end
end

class Shield < Equipable
  attr_reader :attack

  def initialize(name, value, attack)
    super(name, value)
    @attack = attack
  end

  def use (player)
    player.defense += @value
    player.attack += @attack
    puts "#{player.name} equips #{@name} and gains +#{@value} of defense!"
    puts "#{player.name} equips #{@name} and gains +#{@attack} of attack!"
  end
end

class Staff < Equipable
  def initialize(name, value)
    super(name, value)
  end
  def use (player)
    player.intelligence += @value
    puts "#{player.name} equips #{@name} and gains +#{@value} of intelligence!"
  end
end

class Scroll < Equipable
  def initialize(name, value)
    super(name, value)
  end

  def use (player)
    player.intelligence += @value
    puts "#{player.name} unfurls the #{@name}, and arcane whispers fill their mind! Intelligence +#{@value}!"
  end
end

class Gauntlet < Equipable
  def initialize (name, value)
    super(name, value)
  end

  def use (player)
    player.strength += @value
    puts "#{player.name} straps on the #{@name} — ancient runes blaze! Strength +#{@value}!"
  end
end

