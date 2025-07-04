class GoblinMage < Character
  attr_accessor :haste

  def initialize(name: 'Goblin Mage', hp: 90, attack: 18, defense: 15, level: 5, xp_given: 160)
    super(name: name, hp: hp, attack: attack, defense: defense, level: level, xp_given: xp_given)
    @haste = 0
  end

  def attack_target(target)
    puts "#{@name} chants dark incantations, eyes glowing with arcane power!"

    if @haste >= 100
      base = @attack * 8
      puts "#{@name} unleashes a devastating fireball that scorches everything in its path!"
      @haste = 0
    else
      base = @attack + rand(4..8)
      @haste += 15
    end

    apply_damage(target, base)
  end
end