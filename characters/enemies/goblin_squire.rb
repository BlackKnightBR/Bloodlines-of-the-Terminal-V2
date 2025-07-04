class GoblinSquire < Character
  attr_accessor :haste

  def initialize(name: 'Goblin Squire', hp: 110, attack: 15, defense: 25, level: 4, xp_given: 120)
    super(name: name, hp: hp, attack: attack, defense: defense, level: level, xp_given: xp_given)
    @haste = 0
  end

  def attack_target(target)
    puts "#{@name} lunges forward, shield raised and sword ready!"

    if @haste >= 100
      base = @attack * 4
      puts "#{@name} lets out a fierce battle cry and delivers a powerful strike!"
      @haste = 0
    else
      base = @attack + rand(3..6)
      @haste += 20
    end

    apply_damage(target, base)
  end
end