class GoblinAcolyte < Character
  attr_accessor :haste

  def initialize(name: 'Goblin Acolyte', hp: 100, attack: 16, defense: 20, level: 5, xp_given: 150)
    super(name: name, hp: hp, attack: attack, defense: defense, level: level, xp_given: xp_given)
    @haste = 0
  end

  def attack_target(target)
    puts "#{@name} darts forward, his crude dagger gleaming with a sickly sheen!"

    if @haste >= 110
      base = @attack * 10
      puts "#{@name} shrieks a guttural chant and drives his jagged dagger deep with fanatic fury!"
      @haste = 0
    else
      base = @attack + 5
      @haste += 10
    end

    apply_damage(target, base)
  end
end