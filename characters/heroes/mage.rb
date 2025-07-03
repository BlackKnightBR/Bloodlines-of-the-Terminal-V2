class Mage < Character
  attr_accessor :intelligence, :charm
  def initialize(name: 'Avalonia', hp: 100, attack: 10, defense: 15, type: 'mage', level: 1, xp_given: 100)
    super(name: name, hp: hp, attack: attack, defense: defense, type: type, level: level, xp_given: xp_given)
    @intelligence = 15
    @charm = 0

  end

  def attack_target(target)
    puts 'Schwiiiin!'
  
    if @charm >= 30
      base = @attack + @intelligence
      puts "#{@name} strikes with magical power!"
      @charm -= 30
    else
      base = [@attack - (@intelligence / 4), 0].max
      @charm += 10
    end
  
    apply_damage(target, base)
  end

  def gain_xp(amount)
    super(amount)
    if @level > 1
      @intelligence += 5
    end
    nil
  end

  def skill_move(target)
    if @charm >= 20
      puts "#{@name} conjures a blazing inferno, scorching all in its path!"
      sleep(0.3)
      base = @attack + @intelligence * 3
      @charm -= 20
      apply_damage(target, base)
    else
      puts "#{@name} tries to summon dark flames but the abyss is silent..."
    end
  end

  def status
    super
    puts "Charm: #{@charm}"
    puts "Intelligence: #{@intelligence}"
    puts "-" * 40
  end
end