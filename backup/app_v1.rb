class Character
  attr_accessor :name, :hp, :attack, :defense

  def initialize(name:'Douche', hp:100, attack:10, defense:15)
    @name = name
    @hp = hp
    @attack = attack
    @defense = defense
  end

  def attack(target)
    apply_damage(target, @attack)
  end

  def take_damage(amount)
    @hp -= amount
    @hp = 0 if @hp < 0
  end

  def alive? = @hp > 0

  protected

  def apply_damage(target, base_damage)
    damage = base_damage - target.defense
    damage = 0 if damage < 0
    target.take_damage(damage)
  end

end

class Warrior < Character
  attr_accessor :strength, :rage

  def initialize(name: 'Conan', hp: 150, attack: 15, defense: 10)
    super(name: name, hp: hp, attack: attack, defense: defense)
    @strength = 5
    @rage = 0
  end

  def attack(target)
    puts 'Scaaadouche!'
  
    if @rage > 40
      base = @attack * 2
      @rage = 0
    else
      base = @attack + @strength
      @rage += 10
    end
  
    apply_damage(target, base)
  end

end

class Mage < Character
  attr_accessor :intelligence, :charm
  def initialize(name: 'Avalonia', hp: 80, attack: 10, defense: 30)
    super(name: name, hp: hp, attack: attack, defense: defense)
    @intelligence = 5
    @charm = 0

  end

  def attack(target)
    puts 'Schwiiiin!'
  
    if @charm > 50
      base = @attack + @intelligence
      @charm = 0
    else
      base = @attack - @intelligence
      @charm += 10
    end
  
    apply_damage(target, base)
  end
end