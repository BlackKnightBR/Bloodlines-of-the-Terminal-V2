class Goblin_King < Character
  attr_accessor  :haste
  def initialize(name: 'The Goblin King', hp: 600, attack: 50, defense: 30)
    super(name: name, hp: hp, attack: attack, defense: defense)
    @haste = 0
  end

  def attack_target(target)
    puts "#{@name} lets out a blood-curdling screech and raises his monstrous axe!"

    if @attack <= 10
      puts "#{@name} swings pathetically—his strength sapped, his glory fading into rot..."
    end

    if @haste >= 320
      base = @attack * 10
      puts "#{@name}'s eyes glow crimson as he brings down his cursed axe with catastrophic force!"
      @haste = 0

    elsif @haste >= 280
      puts "#{@name} foams at the mouth, his veins bulging as dark energy gathers around his blade!"
      base = @attack + 25
      @haste += 10

    elsif @haste >= 220
      puts "#{@name} growls in an unknown tongue, calling upon ancestral rage!"
      base = @attack + 20
      @haste += 10

    elsif @haste >= 110
      puts "#{@name} begins to chant and grip his axe tighter... something wicked brews!"
      base = @attack + 10
      @haste += 10

    else
      base = @attack + 5
      @haste += 10
    end
  
    apply_damage(target, base)
  end
end