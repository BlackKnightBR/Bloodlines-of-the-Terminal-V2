class Warrior < Character
  attr_accessor :strength, :rage

  def initialize(name: 'Conan', hp: 150, attack: 30, defense: 10, type: 'warrior', level: 1, xp_given: 100)
    super(name: name, hp: hp, attack: attack, defense: defense, type: type, level: level, xp_given: xp_given)
    @strength = 10
    @rage = 0
  end

  def attack_target(target)
    puts 'Scaaadouche!'
  
    if @rage >= 50
      base = @attack  + @strength * 2
      puts "#{@name} strikes with critical hit!"
      @rage -= 20
    else
      base = @attack + @strength
      @rage += 10
    end
  
    apply_damage(target, base)
  end

  def gain_xp(amount)
    super(amount)
    if @level > 1
      @strength += 5
    end
    nil
  end

  def skill_move(target)
    if @rage >= 50
      puts "#{@name} channels the fury of a tempest and strikes with hellish force!"
      sleep(0.3)
      base = @attack + @strength * 4
      @rage -= 50
      apply_damage(target, base)
    else
      puts "#{@name}'s rage simmers too low... The dark powers reject his call."
    end
  end

  def status
    super
    puts "Rage: #{@rage}"
    puts "Strength: #{@strength}"
    puts "-" * 40
  end
end