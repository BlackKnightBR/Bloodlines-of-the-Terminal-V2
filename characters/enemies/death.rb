class DeathBoss < Character
  attr_accessor :haste, :mana, :rage

  def initialize(name: 'DEATH', hp: 10000, attack: 1000, defense: 1000, level: 10000, xp_given: 0)
    super(name: name, hp: hp, attack: attack, defense: defense, level: level, xp_given: xp_given)
    @haste = 0
    @mana = 1000
    @rage = 0
  end

  def attack_target(target)
    puts "\n#{@name} manifests — its presence drains the light itself."

    if @haste >= 200 && @mana >= 40
      # Ritual Death Strike
      damage = @attack * 7
      puts "#{@name} utters the True Name of Oblivion... ⚡ Final Strike shatters the soul!"
      @haste = 0
      @mana -= 40
      apply_damage(target, damage)
    
    elsif @mana >= 30 && rand < 0.3
      # Drain Soul (heal + damage)
      drain = rand(30..50)
      puts "#{@name} drains the essence of #{target.name} (+#{drain} HP to self)"
      @hp += drain
      apply_damage(target, drain)
      @mana -= 30
      @haste += 20

    elsif @rage >= 100
      # Berserker Assault
      puts "#{@name}'s form fractures — a thousand blades rush forward!"
      damage = @attack + 100
      apply_damage(target, damage)
      @rage = 0
      @haste += 30

    elsif @haste >= 100
      # Preparation chant
      puts "#{@name} chants in a language older than time..."
      @haste += 40
      @rage += 30

    else
      # Basic attack
      base = @attack + rand(10..25)
      puts "#{@name} swings its scythe — reality bends."
      apply_damage(target, base)
      @haste += 25
      @rage += 20
    end
  end
end