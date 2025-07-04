class GoblinJailer < Character
  attr_accessor  :haste
  def initialize(name: 'The Jailer', hp: 150, attack: 10, defense: 35, level: 10, xp_given: 200)
    super(name: name, hp: hp, attack: attack, defense: defense, level: level, xp_given: xp_given)
    @haste = 0
  end

  def attack_target(target)
    "#{@name} swings his rusted club with a savage snarl!"

    if @haste >= 30
      puts "#{@name} lets out a guttural howl — his club, soaked in filth, flies straight for your chest!"
      base = @attack + 10
      @haste = 0
    elsif @haste >= 20  
      puts "#{@name} shrieks, 'Time to crush your bones!' and charges forward."
      base = @attack + 7
      @haste += 10
    else
      base = @attack + 6
      @haste += 10
    end
  
    apply_damage(target, base)
  end
end