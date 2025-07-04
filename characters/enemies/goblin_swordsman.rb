class GoblinSwordsman < Character
  attr_accessor :focus

  def initialize(name: 'Goblin Swordsman', hp: 110, attack: 20, defense: 15, level: 4, xp_given: 100)
    super(name: name, hp: hp, attack: attack, defense: defense, level: level, xp_given: xp_given)
    @focus = 0
  end

  def attack_target(target)
    if @focus >= 3
      puts "#{@name} snarls and executes a flurry of vicious strikes, blade flashing like a serpent!"
      base = @attack * 2
      @focus = 0
    else
      puts "#{@name} slashes with his chipped blade, looking for an opening."
      base = @attack + rand(3..6)
      @focus += 1
    end

    apply_damage(target, base)
  end
end