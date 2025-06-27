class Goblin < Character
  attr_accessor  :haste
  def initialize(name: 'Goblin', hp: 100, attack: 16, defense: 12)
    super(name: name, hp: hp, attack: attack, defense: defense)
    @haste = 0
  end

  def attack_target(target)
    puts "#{@name}'s club whistles through the air—like a curse, it hungers for your skull!"
  
    if @haste >= 110
      base = @attack * 10
      puts "#{@name} shrieks a tribal war cry and lashes out with his jagged club!"
      @haste = 0
    else
      base = @attack + 5
      @haste += 10
    end
  
    apply_damage(target, base)
  end
end